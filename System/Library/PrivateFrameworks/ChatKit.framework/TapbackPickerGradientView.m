@interface TapbackPickerGradientView
- (_TtC7ChatKitP33_F9B6E841E8DE6EE361333F7360F8ABF325TapbackPickerGradientView)initWithCoder:(id)a3;
- (_TtC7ChatKitP33_F9B6E841E8DE6EE361333F7360F8ABF325TapbackPickerGradientView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation TapbackPickerGradientView

- (_TtC7ChatKitP33_F9B6E841E8DE6EE361333F7360F8ABF325TapbackPickerGradientView)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC7ChatKitP33_F9B6E841E8DE6EE361333F7360F8ABF325TapbackPickerGradientView_selectionColor) = 1;
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC7ChatKitP33_F9B6E841E8DE6EE361333F7360F8ABF325TapbackPickerGradientView_isSelected) = 0;
  id v4 = a3;

  result = (_TtC7ChatKitP33_F9B6E841E8DE6EE361333F7360F8ABF325TapbackPickerGradientView *)sub_18F7BA5D0();
  __break(1u);
  return result;
}

- (_TtC7ChatKitP33_F9B6E841E8DE6EE361333F7360F8ABF325TapbackPickerGradientView)initWithFrame:(CGRect)a3
{
  return (_TtC7ChatKitP33_F9B6E841E8DE6EE361333F7360F8ABF325TapbackPickerGradientView *)sub_18F6BE058();
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TapbackPickerGradientView();
  id v2 = v5.receiver;
  [(CKGradientView *)&v5 layoutSubviews];
  id v3 = objc_msgSend(v2, sel_maskView, v5.receiver, v5.super_class);
  objc_msgSend(v3, sel_setNeedsLayout);

  id v4 = objc_msgSend(v2, sel_maskView);
  objc_msgSend(v4, sel_layoutIfNeeded);
}

@end