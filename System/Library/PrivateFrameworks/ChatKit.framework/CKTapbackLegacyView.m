@interface CKTapbackLegacyView
- (BOOL)isSelected;
- (CKTapbackLegacyView)initWithCoder:(id)a3;
- (CKTapbackLegacyView)initWithFrame:(CGRect)a3;
- (CKTapbackViewDelegate)delegate;
- (UIEdgeInsets)platterEdgeInsets;
- (double)attributionScaleFactor;
- (void)configureForTapback:(id)a3 isSelected:(BOOL)a4;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setIsSelected:(BOOL)a3;
@end

@implementation CKTapbackLegacyView

- (double)attributionScaleFactor
{
  return 0.9;
}

- (UIEdgeInsets)platterEdgeInsets
{
  double v2 = *(double *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___CKTapbackLegacyView_platterEdgeInsets);
  double v3 = *(double *)((char *)&self->super.super.super._responderFlags + OBJC_IVAR___CKTapbackLegacyView_platterEdgeInsets);
  double v4 = *(double *)((char *)&self->super.super.super.__layeringSceneIdentity
                 + OBJC_IVAR___CKTapbackLegacyView_platterEdgeInsets);
  double v5 = *(double *)((char *)&self->super.super._constraintsExceptingSubviewAutoresizingConstraints
                 + OBJC_IVAR___CKTapbackLegacyView_platterEdgeInsets);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (CKTapbackViewDelegate)delegate
{
  double v2 = (char *)self + OBJC_IVAR___CKTapbackLegacyView_delegate;
  swift_beginAccess();
  double v3 = (void *)MEMORY[0x192FBC390](v2);

  return (CKTapbackViewDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isSelected
{
  double v2 = (BOOL *)self + OBJC_IVAR___CKTapbackLegacyView_isSelected;
  swift_beginAccess();
  return *v2;
}

- (void)setIsSelected:(BOOL)a3
{
  double v4 = self;
  sub_18F4DE038(a3);
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for TapbackLegacyView();
  double v2 = (char *)v10.receiver;
  [(CKTapbackLegacyView *)&v10 layoutSubviews];
  objc_msgSend(v2, sel_bounds, v10.receiver, v10.super_class);
  double x = v11.origin.x;
  double y = v11.origin.y;
  double width = v11.size.width;
  CGFloat height = v11.size.height;
  double v7 = CGRectGetWidth(v11);
  v12.origin.double x = x;
  v12.origin.double y = y;
  v12.size.double width = width;
  v12.size.CGFloat height = height;
  double v8 = CGRectGetHeight(v12);
  v9 = *(void **)&v2[OBJC_IVAR___CKTapbackLegacyView_glyphView];
  if (v9)
  {
    if (v8 >= v7) {
      double v8 = v7;
    }
    objc_msgSend(v9, sel_setFrame_, CGSizeCenteredInRect(v8, v8, x, y, width));
  }
}

- (CKTapbackLegacyView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___CKTapbackLegacyView_attributionScaleFactor) = (Class)0x3FECCCCCCCCCCCCDLL;
  double v8 = (_OWORD *)((char *)self + OBJC_IVAR___CKTapbackLegacyView_platterEdgeInsets);
  __asm
  {
    FMOV            V0.2D, #1.0
    FMOV            V1.2D, #-1.0
  }
  *double v8 = _Q0;
  v8[1] = _Q1;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___CKTapbackLegacyView_glyphView) = 0;
  *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR___CKTapbackLegacyView_isSelected) = 0;
  v16.receiver = self;
  v16.super_class = (Class)type metadata accessor for TapbackLegacyView();
  return -[TapbackView initWithFrame:](&v16, sel_initWithFrame_, x, y, width, height);
}

- (CKTapbackLegacyView)initWithCoder:(id)a3
{
  return (CKTapbackLegacyView *)TapbackLegacyView.init(coder:)(a3);
}

- (void).cxx_destruct
{
  sub_18F4C25DC((uint64_t)self + OBJC_IVAR___CKTapbackLegacyView_delegate);
  double v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___CKTapbackLegacyView_glyphView);
}

- (void)configureForTapback:(id)a3 isSelected:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  CGRect v11 = self;
  uint64_t v7 = CKMessageAcknowledgmentTypeFromIMAssociatedMessageType((uint64_t)objc_msgSend(v6, sel_associatedMessageType));
  if (v7 == 2000) {
    unsigned int v8 = 3;
  }
  else {
    unsigned int v8 = 4;
  }
  if (v4) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0xFFFFFFFFLL;
  }
  id v10 = objc_msgSend(self, sel_glyphViewForAcknowledgmentType_glyphColor_, v7, v9);
  sub_18F4DDE54(v10);
}

@end