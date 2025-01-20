@interface CKTapbackPickerBalloonParentView
- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (CGRect)frame;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CKGradientReferenceView)gradientReferenceView;
- (CKTapbackPickerBalloonDisplayConfiguration)displayConfiguration;
- (CKTapbackPickerBalloonParentView)initWithCoder:(id)a3;
- (CKTapbackPickerBalloonParentView)initWithFrame:(CGRect)a3;
- (CKTapbackPickerBalloonParentView)initWithTapbackPickerPreferredContentSize:(CGSize)a3;
- (CKTapbackPickerBalloonParentViewDelegate)delegate;
- (CKTapbackPickerViewController)tapbackPickerViewController;
- (UIColor)tintColor;
- (double)preferredOriginXWithBalloonSourceFrame:(CGRect)a3 presentationBounds:(CGRect)a4 proposedSize:(CGSize)a5;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (int64_t)currentDisplayMode;
- (void)dealloc;
- (void)dismiss;
- (void)insertEmoji:(id)a3;
- (void)insertSticker:(id)a3;
- (void)insertTapback:(id)a3;
- (void)interfaceStyleChanged;
- (void)layoutSubviews;
- (void)returnToSelection;
- (void)setCurrentDisplayMode:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayConfiguration:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setGradientReferenceView:(id)a3;
- (void)setTapbackPickerViewController:(id)a3;
- (void)setTintColor:(id)a3;
- (void)showEmojiKeyboard;
- (void)textViewDidChange:(id)a3;
@end

@implementation CKTapbackPickerBalloonParentView

- (CGRect)frame
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for TapbackPickerBalloonParentView();
  [(CKTapbackPickerBalloonParentView *)&v6 frame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for TapbackPickerBalloonParentView();
  id v7 = v8.receiver;
  -[CKTapbackPickerBalloonParentView setFrame:](&v8, sel_setFrame_, x, y, width, height);
  sub_18F569A4C();
}

- (UIColor)tintColor
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for TapbackPickerBalloonParentView();
  double v2 = [(CKTapbackPickerBalloonParentView *)&v4 tintColor];

  return v2;
}

- (void)setTintColor:(id)a3
{
  id v6 = a3;
  double v5 = self;
  sub_18F56ED18((uint64_t)a3);
}

- (CKTapbackPickerBalloonParentViewDelegate)delegate
{
  return (CKTapbackPickerBalloonParentViewDelegate *)sub_18F569D50((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___CKTapbackPickerBalloonParentView_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (CKGradientReferenceView)gradientReferenceView
{
  return (CKGradientReferenceView *)sub_18F569D50((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___CKTapbackPickerBalloonParentView_gradientReferenceView);
}

- (void)setGradientReferenceView:(id)a3
{
  id v5 = a3;
  objc_super v4 = self;
  sub_18F56EDD8();
}

- (CKTapbackPickerViewController)tapbackPickerViewController
{
  double v2 = (id *)((char *)&self->super.super.super.isa
            + OBJC_IVAR___CKTapbackPickerBalloonParentView_tapbackPickerViewController);
  swift_beginAccess();
  return (CKTapbackPickerViewController *)*v2;
}

- (void)setTapbackPickerViewController:(id)a3
{
  id v5 = (void **)((char *)&self->super.super.super.isa
               + OBJC_IVAR___CKTapbackPickerBalloonParentView_tapbackPickerViewController);
  swift_beginAccess();
  id v6 = *v5;
  *id v5 = a3;
  id v7 = a3;
  objc_super v8 = self;

  sub_18F56A238();
}

- (CKTapbackPickerBalloonDisplayConfiguration)displayConfiguration
{
  double v2 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR___CKTapbackPickerBalloonParentView_displayConfiguration);
  swift_beginAccess();
  return (CKTapbackPickerBalloonDisplayConfiguration *)*v2;
}

- (void)setDisplayConfiguration:(id)a3
{
  id v5 = a3;
  objc_super v4 = self;
  sub_18F56EEC8(v5);
}

- (int64_t)currentDisplayMode
{
  double v2 = (int64_t *)((char *)self + OBJC_IVAR___CKTapbackPickerBalloonParentView_currentDisplayMode);
  swift_beginAccess();
  return *v2;
}

- (void)setCurrentDisplayMode:(int64_t)a3
{
  objc_super v4 = self;
  sub_18F56A770(a3);
}

- (CKTapbackPickerBalloonParentView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_18F56F730();
}

- (CKTapbackPickerBalloonParentView)initWithTapbackPickerPreferredContentSize:(CGSize)a3
{
  return (CKTapbackPickerBalloonParentView *)TapbackPickerBalloonParentView.init(tapbackPickerPreferredContentSize:)(a3.width, a3.height);
}

- (void)interfaceStyleChanged
{
  double v2 = self;
  sub_18F56D550();
}

- (void)dealloc
{
  double v2 = self;
  TapbackPickerBalloonParentView.__deallocating_deinit();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CKTapbackPickerBalloonParentView_bottomPileMetaballContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CKTapbackPickerBalloonParentView_bottomPileContentContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CKTapbackPickerBalloonParentView_primaryContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CKTapbackPickerBalloonParentView_messageBalloonContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CKTapbackPickerBalloonParentView_frontPileMetaballContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CKTapbackPickerBalloonParentView_frontPileContentContainer));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CKTapbackPickerBalloonParentView_accessoryItemsContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CKTapbackPickerBalloonParentView_inputController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CKTapbackPickerBalloonParentView_presentationTintColor));
  sub_18F4C25DC((uint64_t)self + OBJC_IVAR___CKTapbackPickerBalloonParentView_delegate);

  sub_18F4C25DC((uint64_t)self + OBJC_IVAR___CKTapbackPickerBalloonParentView_gradientReferenceView);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CKTapbackPickerBalloonParentView_tapbackPickerViewController));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___CKTapbackPickerBalloonParentView_displayConfiguration);
}

- (void)dismiss
{
  double v2 = self;
  sub_18F56C484();
}

- (void)returnToSelection
{
  double v2 = self;
  sub_18F56C764();
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v8 = a4;
  v9 = self;
  id v10 = sub_18F56D0DC((uint64_t)a4, x, y);

  return v10;
}

- (void)layoutSubviews
{
  double v2 = self;
  sub_18F56D3FC();
}

- (CKTapbackPickerBalloonParentView)initWithFrame:(CGRect)a3
{
  CGRect result = (CKTapbackPickerBalloonParentView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)showEmojiKeyboard
{
  id v3 = (char *)self + OBJC_IVAR___CKTapbackPickerBalloonParentView_delegate;
  swift_beginAccess();
  objc_super v4 = (void *)MEMORY[0x192FBC390](v3);
  if (v4)
  {
    id v5 = v4;
    unsigned __int8 v6 = objc_msgSend(v4, sel_respondsToSelector_, sel_tapbackPickerBalloonParentViewRequestedShowEmojiKeyboard_);
    id v7 = self;
    if (v6) {
      objc_msgSend(v5, sel_tapbackPickerBalloonParentViewRequestedShowEmojiKeyboard_, v7);
    }
    swift_unknownObjectRelease();
  }
  else
  {
    id v8 = self;
  }
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___CKTapbackPickerBalloonParentView_inputController), sel_becomeFirstResponder);
}

- (void)insertEmoji:(id)a3
{
  uint64_t v4 = sub_18F7B97E0();
  unsigned __int8 v6 = v5;
  id v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  TapbackPickerBalloonParentView.insertEmoji(_:)(v8);

  swift_bridgeObjectRelease();
}

- (void)insertTapback:(id)a3
{
  id v4 = a3;
  id v5 = self;
  TapbackPickerBalloonParentView.insertTapback(tapback:)(v4);
}

- (void)insertSticker:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_18F76B3A4(v4);
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  sub_18F7B97E0();
  id v7 = a3;
  Swift::String v8 = self;
  v9 = (void *)sub_18F7B97A0();
  int v10 = CEMStringContainsEmoji();

  swift_bridgeObjectRelease();
  return v10 != 0;
}

- (void)textViewDidChange:(id)a3
{
  id v4 = (UITextView *)a3;
  id v5 = self;
  TapbackPickerBalloonParentView.textViewDidChange(_:)(v4);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  double v4 = _s7ChatKit30TapbackPickerBalloonParentViewC12sizeThatFitsySo6CGSizeVAFF_0();
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (double)preferredOriginXWithBalloonSourceFrame:(CGRect)a3 presentationBounds:(CGRect)a4 proposedSize:(CGSize)a5
{
  CGFloat width = a4.size.width;
  CGFloat height = a4.size.height;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v7 = a3.size.height;
  double v8 = a3.size.width;
  CGFloat v9 = a3.origin.y;
  double v10 = a3.origin.x;
  v11 = self;
  TapbackPickerBalloonParentView.preferredOriginX(withBalloonSourceFrame:presentationBounds:proposedSize:)(v10, v9, v8, v7, x, y, width, height, v17, v18);
  double v13 = v12;

  return v13;
}

@end