@interface AUDistortionSectionView
- (UIColor)tintColor;
- (_TtC12CoreAudioKit23AUDistortionSectionView)initWithCoder:(id)a3;
- (_TtC12CoreAudioKit23AUDistortionSectionView)initWithFrame:(CGRect)a3;
- (void)parameterChangedWithNotification:(id)a3;
- (void)setTintColor:(id)a3;
@end

@implementation AUDistortionSectionView

- (UIColor)tintColor
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for AUDistortionSectionView();
  v2 = [(AUDistortionSectionView *)&v4 tintColor];

  return v2;
}

- (void)setTintColor:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_21E5B2E14((uint64_t)a3);
}

- (_TtC12CoreAudioKit23AUDistortionSectionView)initWithFrame:(CGRect)a3
{
  return (_TtC12CoreAudioKit23AUDistortionSectionView *)sub_21E5AE50C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12CoreAudioKit23AUDistortionSectionView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_21E5B2EF0();
}

- (void)parameterChangedWithNotification:(id)a3
{
  uint64_t v4 = sub_21E5B6398();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21E5B6378();
  v9 = self;
  sub_21E5AF294();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit23AUDistortionSectionView_visualizationView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit23AUDistortionSectionView_controlsView));
  sub_21E54AF98((uint64_t)self + OBJC_IVAR____TtC12CoreAudioKit23AUDistortionSectionView_dataSource, &qword_267D37EC8);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit23AUDistortionSectionView_audioUnit));

  swift_bridgeObjectRelease();
}

@end