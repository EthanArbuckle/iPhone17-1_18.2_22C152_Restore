@interface CKEmbeddedRichLinkView
- (CGRect)editMenuInteraction:(id)a3 targetRectForConfiguration:(id)a4;
- (CGSize)sizeThatFits:(CGSize)result;
- (_TtC7ChatKit22CKEmbeddedRichLinkView)initWithCoder:(id)a3;
- (_TtC7ChatKit22CKEmbeddedRichLinkView)initWithFrame:(CGRect)a3;
- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5;
- (id)transitionContextForCustomizationPickerController:(id)a3;
- (void)balloonPluginDataSourceDidChange:(id)a3;
- (void)customizationPickerControllerDidDismiss:(id)a3;
- (void)customizationPickerControllerDidPresent:(id)a3;
- (void)customizationPickerControllerWillDismiss:(id)a3;
- (void)customizationPickerControllerWillPresent:(id)a3;
- (void)didTapDiscardButton;
- (void)didTapToPresentEditMenu:(id)a3;
- (void)editMenuInteraction:(id)a3 willDismissMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)editMenuInteraction:(id)a3 willPresentMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)layoutSubviews;
- (void)pluginPayloadDidLoad:(id)a3;
- (void)pluginPayloadWantsResize:(id)a3;
@end

@implementation CKEmbeddedRichLinkView

- (_TtC7ChatKit22CKEmbeddedRichLinkView)initWithFrame:(CGRect)a3
{
  return (_TtC7ChatKit22CKEmbeddedRichLinkView *)sub_18F6546B4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7ChatKit22CKEmbeddedRichLinkView)initWithCoder:(id)a3
{
  return (_TtC7ChatKit22CKEmbeddedRichLinkView *)sub_18F654814(a3);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_18F654AFC();
}

- (CGSize)sizeThatFits:(CGSize)result
{
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC7ChatKit22CKEmbeddedRichLinkView_pluginEntryViewController);
  if (v3) {
    objc_msgSend(v3, sel_sizeThatFits_, result.width, result.height);
  }
  return result;
}

- (void)didTapToPresentEditMenu:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_18F6575D8();
}

- (void)didTapDiscardButton
{
  v2 = self;
  sub_18F6559D4();
}

- (void)pluginPayloadDidLoad:(id)a3
{
  uint64_t v4 = sub_18F7B5D30();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18F7B5CF0();
  v8 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC7ChatKit22CKEmbeddedRichLinkView_pluginEntryViewController);
  if (v8) {
    objc_msgSend(v8, sel_ck_constrainedSizeThatFits_, 0.0, 0.0);
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)pluginPayloadWantsResize:(id)a3
{
  uint64_t v4 = sub_18F7B5D30();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18F7B5CF0();
  v8 = self;
  sub_18F655C40();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void).cxx_destruct
{
  sub_18F4C25DC((uint64_t)self + OBJC_IVAR____TtC7ChatKit22CKEmbeddedRichLinkView_delegate);
  sub_18EF27FE8((uint64_t)self + OBJC_IVAR____TtC7ChatKit22CKEmbeddedRichLinkView_url, (uint64_t *)&unk_1E922C1A0);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit22CKEmbeddedRichLinkView_richLinkDataSource));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit22CKEmbeddedRichLinkView_pluginEntryViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit22CKEmbeddedRichLinkView_discardButton));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC7ChatKit22CKEmbeddedRichLinkView_editMenuInteraction);
}

- (void)balloonPluginDataSourceDidChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_18F656408(v4);
}

- (void)customizationPickerControllerWillPresent:(id)a3
{
}

- (void)customizationPickerControllerDidPresent:(id)a3
{
}

- (void)customizationPickerControllerWillDismiss:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_18F6578C0();
}

- (void)customizationPickerControllerDidDismiss:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_18F65796C();
}

- (id)transitionContextForCustomizationPickerController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = sub_18F657BD0();

  return v6;
}

- (CGRect)editMenuInteraction:(id)a3 targetRectForConfiguration:(id)a4
{
  [(CKEmbeddedRichLinkView *)self frame];
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (void)editMenuInteraction:(id)a3 willPresentMenuForConfiguration:(id)a4 animator:(id)a5
{
}

- (void)editMenuInteraction:(id)a3 willDismissMenuForConfiguration:(id)a4 animator:(id)a5
{
}

- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = self;
  id v10 = sub_18F657D08();

  return v10;
}

@end