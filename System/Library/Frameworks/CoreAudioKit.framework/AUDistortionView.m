@interface AUDistortionView
- (CGRect)bounds;
- (_TtC12CoreAudioKit16AUDistortionView)initWithCoder:(id)a3;
- (_TtC12CoreAudioKit16AUDistortionView)initWithFrame:(CGRect)a3;
- (void)removeFromSuperview;
- (void)setBounds:(CGRect)a3;
@end

@implementation AUDistortionView

- (_TtC12CoreAudioKit16AUDistortionView)initWithFrame:(CGRect)a3
{
  return (_TtC12CoreAudioKit16AUDistortionView *)sub_21E548604(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12CoreAudioKit16AUDistortionView)initWithCoder:(id)a3
{
  return (_TtC12CoreAudioKit16AUDistortionView *)sub_21E548A8C(a3);
}

- (void)removeFromSuperview
{
  v2 = self;
  sub_21E549120();
}

- (CGRect)bounds
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AUDistortionView();
  [(AUDistortionView *)&v6 bounds];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v7 = self;
  sub_21E5495A4(x, y, width, height);
}

- (void).cxx_destruct
{
  sub_21E54AF98((uint64_t)self + OBJC_IVAR____TtC12CoreAudioKit16AUDistortionView_parameterDataSource, &qword_267D37EC8);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit16AUDistortionView_collectionView));
  sub_21E54AF98((uint64_t)self + OBJC_IVAR____TtC12CoreAudioKit16AUDistortionView_delaySectionCellRegistration, &qword_267D37EC0);
  sub_21E54AF98((uint64_t)self + OBJC_IVAR____TtC12CoreAudioKit16AUDistortionView_ringModSectionCellRegistration, &qword_267D37EB8);
  sub_21E54AF98((uint64_t)self + OBJC_IVAR____TtC12CoreAudioKit16AUDistortionView_decimationSectionCellRegistration, &qword_267D37EB0);
  sub_21E54AF98((uint64_t)self + OBJC_IVAR____TtC12CoreAudioKit16AUDistortionView_overdriveSectionCellRegistration, &qword_267D37EA8);
  sub_21E54AF98((uint64_t)self + OBJC_IVAR____TtC12CoreAudioKit16AUDistortionView_globalSectionCellRegistration, &qword_267D37EA0);
  double v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12CoreAudioKit16AUDistortionView_auAudioUnit);
}

@end