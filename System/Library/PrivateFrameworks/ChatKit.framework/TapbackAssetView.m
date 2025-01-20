@interface TapbackAssetView
- (BOOL)isSelected;
- (CKTapbackViewDelegate)delegate;
- (UIEdgeInsets)platterEdgeInsets;
- (_TtC7ChatKit16TapbackAssetView)initWithCoder:(id)a3;
- (_TtC7ChatKit16TapbackAssetView)initWithFrame:(CGRect)a3;
- (double)attributionScaleFactor;
- (void)configureForTapback:(id)a3 isSelected:(BOOL)a4;
- (void)layoutSubviews;
- (void)performViewControllerAppearingAnimation;
- (void)performViewControllerDismissingAnimation;
- (void)setDelegate:(id)a3;
- (void)setIsSelected:(BOOL)a3;
@end

@implementation TapbackAssetView

- (double)attributionScaleFactor
{
  return 1.0;
}

- (UIEdgeInsets)platterEdgeInsets
{
  double v2 = *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7ChatKit16TapbackAssetView_platterEdgeInsets);
  double v3 = *(double *)((char *)&self->super.super._responderFlags
                 + OBJC_IVAR____TtC7ChatKit16TapbackAssetView_platterEdgeInsets);
  double v4 = *(double *)((char *)&self->super.super.__layeringSceneIdentity
                 + OBJC_IVAR____TtC7ChatKit16TapbackAssetView_platterEdgeInsets);
  double v5 = *(double *)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints
                 + OBJC_IVAR____TtC7ChatKit16TapbackAssetView_platterEdgeInsets);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (CKTapbackViewDelegate)delegate
{
  double v2 = (char *)self + OBJC_IVAR____TtC7ChatKit16TapbackAssetView_delegate;
  swift_beginAccess();
  double v3 = (void *)MEMORY[0x192FBC390](v2);

  return (CKTapbackViewDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isSelected
{
  double v2 = (BOOL *)self + OBJC_IVAR____TtC7ChatKit16TapbackAssetView_isSelected;
  swift_beginAccess();
  return *v2;
}

- (void)setIsSelected:(BOOL)a3
{
  double v4 = (BOOL *)self + OBJC_IVAR____TtC7ChatKit16TapbackAssetView_isSelected;
  swift_beginAccess();
  *double v4 = a3;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TapbackAssetView();
  double v2 = (char *)v5.receiver;
  [(TapbackAssetView *)&v5 layoutSubviews];
  double v3 = *(void **)&v2[OBJC_IVAR____TtC7ChatKit16TapbackAssetView_tapbackAssetLayer];
  if (v3)
  {
    double v4 = v3;
    objc_msgSend(v2, sel_center, v5.receiver, v5.super_class);
    objc_msgSend(v4, sel_setPosition_);

    double v2 = v4;
  }
}

- (_TtC7ChatKit16TapbackAssetView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7ChatKit16TapbackAssetView_attributionScaleFactor) = (Class)0x3FF0000000000000;
  v8 = (_OWORD *)((char *)self + OBJC_IVAR____TtC7ChatKit16TapbackAssetView_platterEdgeInsets);
  long long v9 = *(_OWORD *)(MEMORY[0x1E4F437F8] + 16);
  _OWORD *v8 = *MEMORY[0x1E4F437F8];
  v8[1] = v9;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7ChatKit16TapbackAssetView_tapbackAssetLayer) = 0;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC7ChatKit16TapbackAssetView_isSelected) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7ChatKit16TapbackAssetView_stateController) = 0;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for TapbackAssetView();
  return -[TapbackAssetView initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (_TtC7ChatKit16TapbackAssetView)initWithCoder:(id)a3
{
  return (_TtC7ChatKit16TapbackAssetView *)TapbackAssetView.init(coder:)(a3);
}

- (void).cxx_destruct
{
  sub_18F4C25DC((uint64_t)self + OBJC_IVAR____TtC7ChatKit16TapbackAssetView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit16TapbackAssetView_tapbackAssetLayer));
  double v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7ChatKit16TapbackAssetView_stateController);
}

- (void)configureForTapback:(id)a3 isSelected:(BOOL)a4
{
  id v5 = a3;
  v6 = self;
  objc_msgSend(v5, sel_associatedMessageType);
  _s7ChatKit16TapbackAssetViewC04loadD024forAssociatedMessageTypeySo012IMAssociatediJ0V_tF_0();
}

- (void)performViewControllerAppearingAnimation
{
  if (*(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7ChatKit16TapbackAssetView_tapbackAssetLayer))
  {
    double v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7ChatKit16TapbackAssetView_stateController);
    if (v2) {
      objc_msgSend(v2, sel_setInitialStatesOfLayer_);
    }
  }
}

- (void)performViewControllerDismissingAnimation
{
  double v2 = self;
  TapbackAssetView.performViewControllerDismissingAnimation()();
}

@end