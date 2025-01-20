@interface CKTapbackPickerContainerAccessoryView
- (CGPoint)attachmentOffsetWithReferenceFrame:(CGRect)a3;
- (CKTapbackPickerBalloonParentView)pickerBalloonParentView;
- (CKTapbackPickerContainerAccessoryView)initWithFrame:(CGRect)a3 configuration:(id *)a4;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)init:(id)a3 layoutBounds:(CGRect)a4 delegate:(id)a5;
- (void)setVisible:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation CKTapbackPickerContainerAccessoryView

- (CKTapbackPickerBalloonParentView)pickerBalloonParentView
{
  return (CKTapbackPickerBalloonParentView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                     + OBJC_IVAR___CKTapbackPickerContainerAccessoryView_pickerBalloonParentView));
}

- (id)init:(id)a3 layoutBounds:(CGRect)a4 delegate:(id)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v10 = a3;
  swift_unknownObjectRetain();
  return TapbackPickerContainerAccessoryView.init(_:layoutBounds:delegate:)(v10, a5, x, y, width, height);
}

- (void)setVisible:(BOOL)a3 animated:(BOOL)a4
{
  if (*((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR___CKTapbackPickerContainerAccessoryView_visible) != a3)
  {
    *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR___CKTapbackPickerContainerAccessoryView_visible) = a3;
    v5 = self;
    if (a3) {
      sub_18F56BDFC();
    }
    else {
      sub_18F56C484();
    }
  }
}

- (CGPoint)attachmentOffsetWithReferenceFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v7 = self;
  double v8 = sub_18F73F130(x, y, width, height);
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.CGFloat y = v12;
  result.CGFloat x = v11;
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  id v4 = objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR___CKTapbackPickerContainerAccessoryView_pickerBalloonParentView), sel_hitTest_withEvent_, a4, a3.x, a3.y);

  return v4;
}

- (CKTapbackPickerContainerAccessoryView)initWithFrame:(CGRect)a3 configuration:(id *)a4
{
  CGPoint result = (CKTapbackPickerContainerAccessoryView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CKTapbackPickerContainerAccessoryView_pickerViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CKTapbackPickerContainerAccessoryView_pickerBalloonParentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CKTapbackPickerContainerAccessoryView_chatItem));
  v3 = (char *)self + OBJC_IVAR___CKTapbackPickerContainerAccessoryView_delegate;

  sub_18F4C25DC((uint64_t)v3);
}

@end