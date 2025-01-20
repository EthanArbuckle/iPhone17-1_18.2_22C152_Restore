@interface AUDistortionControlsView
- (UIColor)tintColor;
- (_TtC12CoreAudioKit24AUDistortionControlsView)initWithCoder:(id)a3;
- (_TtC12CoreAudioKit24AUDistortionControlsView)initWithFrame:(CGRect)a3;
- (void)setTintColor:(id)a3;
@end

@implementation AUDistortionControlsView

- (UIColor)tintColor
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for AUDistortionControlsView();
  v2 = [(AUDistortionControlsView *)&v4 tintColor];

  return v2;
}

- (void)setTintColor:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for AUDistortionControlsView();
  [(AUDistortionControlsView *)&v4 setTintColor:a3];
}

- (_TtC12CoreAudioKit24AUDistortionControlsView)initWithFrame:(CGRect)a3
{
  return (_TtC12CoreAudioKit24AUDistortionControlsView *)sub_21E54BA3C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12CoreAudioKit24AUDistortionControlsView)initWithCoder:(id)a3
{
  return (_TtC12CoreAudioKit24AUDistortionControlsView *)sub_21E54BC18(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit24AUDistortionControlsView_titleLabel));
  sub_21E54AF98((uint64_t)self + OBJC_IVAR____TtC12CoreAudioKit24AUDistortionControlsView_owner, &qword_267D37BF8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit24AUDistortionControlsView_audioUnit));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit24AUDistortionControlsView_dataSource));
  sub_21E54AF98((uint64_t)self + OBJC_IVAR____TtC12CoreAudioKit24AUDistortionControlsView_genericCellRegistration, (uint64_t *)&unk_267D37F70);
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12CoreAudioKit24AUDistortionControlsView_collectionView);
}

@end