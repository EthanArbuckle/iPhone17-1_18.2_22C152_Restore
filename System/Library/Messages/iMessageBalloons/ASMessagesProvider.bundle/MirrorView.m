@interface MirrorView
- (UIColor)backgroundColor;
- (_TtC18ASMessagesProvider10MirrorView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider10MirrorView)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setBackgroundColor:(id)a3;
@end

@implementation MirrorView

- (_TtC18ASMessagesProvider10MirrorView)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  uint64_t v5 = OBJC_IVAR____TtC18ASMessagesProvider10MirrorView_artworkLayer;
  id v6 = objc_allocWithZone((Class)CALayer);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 init];
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC18ASMessagesProvider10MirrorView_imageKVOContext) = 0;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC18ASMessagesProvider10MirrorView_imageObserversAdded) = 0;

  result = (_TtC18ASMessagesProvider10MirrorView *)sub_77EB20();
  __break(1u);
  return result;
}

- (void)dealloc
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  v4 = self;
  if (Strong)
  {
    NSString v5 = sub_77D640();
    [Strong removeObserver:v4 forKeyPath:v5];
  }
  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for MirrorView();
  [(MirrorView *)&v6 dealloc];
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC18ASMessagesProvider10MirrorView_artworkLayer);
}

- (UIColor)backgroundColor
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for MirrorView();
  v2 = [(MirrorView *)&v4 backgroundColor];

  return v2;
}

- (void)setBackgroundColor:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for MirrorView();
  objc_super v4 = (char *)v10.receiver;
  id v5 = a3;
  [(MirrorView *)&v10 setBackgroundColor:v5];
  objc_super v6 = *(void **)&v4[OBJC_IVAR____TtC18ASMessagesProvider10MirrorView_artworkLayer];
  id v7 = objc_msgSend(v4, "backgroundColor", v10.receiver, v10.super_class);
  if (v7)
  {
    v8 = v7;
    id v9 = [v7 CGColor];
  }
  else
  {
    id v9 = 0;
  }
  [v6 setBackgroundColor:v9];
}

- (void)layoutSubviews
{
  v2 = self;
  sub_15F938();
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a3)
  {
    uint64_t v10 = sub_77D670();
    v12 = v11;
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    memset(v18, 0, sizeof(v18));
    id v16 = a5;
    v17 = self;
    if (a5) {
      goto LABEL_4;
    }
LABEL_7:
    v15 = 0;
    goto LABEL_8;
  }
  uint64_t v10 = 0;
  v12 = 0;
  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  swift_unknownObjectRetain();
  id v13 = a5;
  v14 = self;
  sub_77E7F0();
  swift_unknownObjectRelease();
  if (!a5) {
    goto LABEL_7;
  }
LABEL_4:
  type metadata accessor for NSKeyValueChangeKey(0);
  sub_160228();
  v15 = (objc_class *)sub_77D500();

LABEL_8:
  sub_15FDE4(v10, v12, (uint64_t)v18, v15, (uint64_t)a6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_FD94((uint64_t)v18);
}

- (_TtC18ASMessagesProvider10MirrorView)initWithFrame:(CGRect)a3
{
  result = (_TtC18ASMessagesProvider10MirrorView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end