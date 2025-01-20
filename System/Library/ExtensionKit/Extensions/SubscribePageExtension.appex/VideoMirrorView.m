@interface VideoMirrorView
- (UIColor)backgroundColor;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
@end

@implementation VideoMirrorView

- (UIColor)backgroundColor
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for VideoMirrorView();
  v2 = [(MirrorView *)&v4 backgroundColor];

  return v2;
}

- (void)setBackgroundColor:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for VideoMirrorView();
  objc_super v4 = (char *)v10.receiver;
  id v5 = a3;
  [(MirrorView *)&v10 setBackgroundColor:v5];
  v6 = *(void **)&v4[OBJC_IVAR____TtC22SubscribePageExtension15VideoMirrorView_videoLayer];
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
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for VideoMirrorView();
  v2 = (char *)v5.receiver;
  [(MirrorView *)&v5 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC22SubscribePageExtension15VideoMirrorView_videoLayer];
  objc_super v4 = *(void **)&v2[OBJC_IVAR____TtC22SubscribePageExtension10MirrorView_artworkLayer];
  objc_msgSend(v4, "bounds", v5.receiver, v5.super_class);
  objc_msgSend(v3, "setBounds:");
  [v4 position];
  objc_msgSend(v3, "setPosition:");
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension15VideoMirrorView_videoLayer);
}

@end