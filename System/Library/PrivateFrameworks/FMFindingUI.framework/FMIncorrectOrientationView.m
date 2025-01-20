@interface FMIncorrectOrientationView
- (_TtC11FMFindingUI26FMIncorrectOrientationView)init;
- (_TtC11FMFindingUI26FMIncorrectOrientationView)initWithCoder:(id)a3;
- (_TtC11FMFindingUI26FMIncorrectOrientationView)initWithFrame:(CGRect)a3;
@end

@implementation FMIncorrectOrientationView

- (_TtC11FMFindingUI26FMIncorrectOrientationView)init
{
  return (_TtC11FMFindingUI26FMIncorrectOrientationView *)sub_24D375490();
}

- (_TtC11FMFindingUI26FMIncorrectOrientationView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_24D3760B4();
}

- (_TtC11FMFindingUI26FMIncorrectOrientationView)initWithFrame:(CGRect)a3
{
  result = (_TtC11FMFindingUI26FMIncorrectOrientationView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI26FMIncorrectOrientationView_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI26FMIncorrectOrientationView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI26FMIncorrectOrientationView_subtitleLabel));
  long long v3 = *(_OWORD *)((char *)&self->super._minimumSafeAreaInsets.bottom
                 + OBJC_IVAR____TtC11FMFindingUI26FMIncorrectOrientationView_style);
  v8[8] = *(_OWORD *)((char *)&self->super._minimumSafeAreaInsets.top
                    + OBJC_IVAR____TtC11FMFindingUI26FMIncorrectOrientationView_style);
  v8[9] = v3;
  v8[10] = *(_OWORD *)((char *)&self->super._layer + OBJC_IVAR____TtC11FMFindingUI26FMIncorrectOrientationView_style);
  uint64_t v9 = *(uint64_t *)((char *)&self->super._minXVariable + OBJC_IVAR____TtC11FMFindingUI26FMIncorrectOrientationView_style);
  long long v4 = *(_OWORD *)((char *)&self->super._gestureRecognizers
                 + OBJC_IVAR____TtC11FMFindingUI26FMIncorrectOrientationView_style);
  v8[4] = *(_OWORD *)((char *)&self->super._subviewCache
                    + OBJC_IVAR____TtC11FMFindingUI26FMIncorrectOrientationView_style);
  v8[5] = v4;
  long long v5 = *(_OWORD *)((char *)&self->super._viewFlags + OBJC_IVAR____TtC11FMFindingUI26FMIncorrectOrientationView_style
                                                   + 16);
  v8[6] = *(_OWORD *)((char *)&self->super._viewFlags + OBJC_IVAR____TtC11FMFindingUI26FMIncorrectOrientationView_style);
  v8[7] = v5;
  long long v6 = *(_OWORD *)((char *)&self->super.super.__layeringSceneIdentity
                 + OBJC_IVAR____TtC11FMFindingUI26FMIncorrectOrientationView_style);
  v8[0] = *(_OWORD *)((char *)&self->super.super.super.isa
                    + OBJC_IVAR____TtC11FMFindingUI26FMIncorrectOrientationView_style);
  v8[1] = v6;
  long long v7 = *(_OWORD *)((char *)&self->super._traitChangeRegistry
                 + OBJC_IVAR____TtC11FMFindingUI26FMIncorrectOrientationView_style);
  v8[2] = *(_OWORD *)((char *)&self->super._cachedTraitCollection
                    + OBJC_IVAR____TtC11FMFindingUI26FMIncorrectOrientationView_style);
  v8[3] = v7;
  sub_24D3455A4((uint64_t)v8);
}

@end