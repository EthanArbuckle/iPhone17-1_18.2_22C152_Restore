@interface CKLinkPreviewTextAttachment
+ (BOOL)supportsSecureCoding;
- (BOOL)canPresentCustomizationPicker;
- (BOOL)supportsCustomizationForEmbeddedRichLinkView:(id)a3;
- (BOOL)usesTextAttachmentView;
- (CKEmbeddedRichLinkConfiguration)configuration;
- (NSString)entryItemUUID;
- (NSString)urlText;
- (_TtC7ChatKit27CKLinkPreviewTextAttachment)initWithCoder:(id)a3;
- (_TtC7ChatKit27CKLinkPreviewTextAttachment)initWithData:(id)a3 ofType:(id)a4;
- (_TtC7ChatKit27CKLinkPreviewTextAttachment)initWithDelegate:(id)a3 configuration:(id)a4;
- (double)downscaleMultiplier;
- (double)downscaleMultiplierForEmbeddedRichLinkView:(id)a3;
- (double)maxWidthForEmbeddedRichLinkView:(id)a3;
- (id)imageForBounds:(CGRect)a3 textContainer:(id)a4 characterIndex:(int64_t)a5;
- (id)makeThrowAnimationSnapshotView;
- (id)viewProviderForParentView:(id)a3 location:(id)a4 textContainer:(id)a5;
- (void)embeddedRichLinkView:(id)a3 didAddPluginEntryViewControllerToViewHierarchy:(id)a4;
- (void)embeddedRichLinkView:(id)a3 didFinishPreparingPluginPayload:(id)a4;
- (void)embeddedRichLinkView:(id)a3 didSelectInteractionType:(int64_t)a4;
- (void)embeddedRichLinkView:(id)a3 requestedTransitionToSize:(CGSize)a4;
- (void)embeddedRichLinkView:(id)a3 willAddPluginEntryViewControllerToViewHierarchy:(id)a4;
- (void)embeddedRichLinkViewDidDismissCustomizationPicker:(id)a3;
- (void)embeddedRichLinkViewDidPresentCustomizationPicker:(id)a3;
- (void)embeddedRichLinkViewWillDismissCustomizationPicker:(id)a3;
- (void)embeddedRichLinkViewWillPresentCustomizationPicker:(id)a3;
- (void)invalidateSizingInformation;
- (void)presentCustomizationPicker;
- (void)setDownscaleMultiplier:(double)a3;
@end

@implementation CKLinkPreviewTextAttachment

- (CKEmbeddedRichLinkConfiguration)configuration
{
  return (CKEmbeddedRichLinkConfiguration *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                                    + OBJC_IVAR____TtC7ChatKit27CKLinkPreviewTextAttachment_configuration));
}

- (double)downscaleMultiplier
{
  v2 = (double *)((char *)self + OBJC_IVAR____TtC7ChatKit27CKLinkPreviewTextAttachment_downscaleMultiplier);
  swift_beginAccess();
  return *v2;
}

- (void)setDownscaleMultiplier:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR____TtC7ChatKit27CKLinkPreviewTextAttachment_downscaleMultiplier);
  swift_beginAccess();
  double *v4 = a3;
}

- (_TtC7ChatKit27CKLinkPreviewTextAttachment)initWithDelegate:(id)a3 configuration:(id)a4
{
  return (_TtC7ChatKit27CKLinkPreviewTextAttachment *)CKLinkPreviewTextAttachment.init(delegate:configuration:)((uint64_t)a3, a4);
}

- (_TtC7ChatKit27CKLinkPreviewTextAttachment)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_18F6A15F0();
}

+ (BOOL)supportsSecureCoding
{
  return 0;
}

- (BOOL)usesTextAttachmentView
{
  return 1;
}

- (id)viewProviderForParentView:(id)a3 location:(id)a4 textContainer:(id)a5
{
  id v9 = a3;
  swift_unknownObjectRetain();
  id v10 = a5;
  v11 = self;
  sub_18F6A08AC(a3, (uint64_t)a4, a5);
  v13 = v12;

  swift_unknownObjectRelease();

  return v13;
}

- (id)imageForBounds:(CGRect)a3 textContainer:(id)a4 characterIndex:(int64_t)a5
{
  id v6 = a4;
  v7 = self;
  v8 = (void *)sub_18F6A1718();

  return v8;
}

- (id)makeThrowAnimationSnapshotView
{
  v2 = self;
  id v3 = sub_18F654E58();

  return v3;
}

- (void)invalidateSizingInformation
{
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC7ChatKit27CKLinkPreviewTextAttachment_isAttachmentSizeInvalidated) = 1;
}

- (_TtC7ChatKit27CKLinkPreviewTextAttachment)initWithData:(id)a3 ofType:(id)a4
{
  if (a3)
  {
    id v5 = a4;
    id v6 = a3;
    sub_18F7B60D0();
  }
  result = (_TtC7ChatKit27CKLinkPreviewTextAttachment *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_18F4C25DC((uint64_t)self + OBJC_IVAR____TtC7ChatKit27CKLinkPreviewTextAttachment_delegate);
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7ChatKit27CKLinkPreviewTextAttachment_configuration));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7ChatKit27CKLinkPreviewTextAttachment_viewProvider));
  id v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7ChatKit27CKLinkPreviewTextAttachment_embeddedLinkView);
}

- (void)embeddedRichLinkView:(id)a3 didSelectInteractionType:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  sub_18F6A1A08(a4);
}

- (void)embeddedRichLinkView:(id)a3 didFinishPreparingPluginPayload:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_18F6A1B44((uint64_t)v7);
}

- (void)embeddedRichLinkView:(id)a3 requestedTransitionToSize:(CGSize)a4
{
  id v5 = a3;
  id v6 = self;
  sub_18F6A1C54();
}

- (void)embeddedRichLinkView:(id)a3 willAddPluginEntryViewControllerToViewHierarchy:(id)a4
{
}

- (void)embeddedRichLinkView:(id)a3 didAddPluginEntryViewControllerToViewHierarchy:(id)a4
{
}

- (double)maxWidthForEmbeddedRichLinkView:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_18F6A1EE0();
  double v7 = v6;

  return v7;
}

- (double)downscaleMultiplierForEmbeddedRichLinkView:(id)a3
{
  id v3 = (double *)((char *)self + OBJC_IVAR____TtC7ChatKit27CKLinkPreviewTextAttachment_downscaleMultiplier);
  swift_beginAccess();
  return *v3;
}

- (BOOL)supportsCustomizationForEmbeddedRichLinkView:(id)a3
{
  uint64_t v5 = MEMORY[0x192FBC390]((char *)self + OBJC_IVAR____TtC7ChatKit27CKLinkPreviewTextAttachment_delegate, a2);
  if (v5)
  {
    double v6 = (void *)v5;
    id v7 = a3;
    v8 = self;
    unsigned __int8 v9 = objc_msgSend(v6, sel_supportsCustomizationForLinkPreviewTextAttachment_, v8);

    swift_unknownObjectRelease();
    LOBYTE(v5) = v9;
  }
  return v5;
}

- (void)embeddedRichLinkViewWillPresentCustomizationPicker:(id)a3
{
}

- (void)embeddedRichLinkViewDidPresentCustomizationPicker:(id)a3
{
}

- (void)embeddedRichLinkViewWillDismissCustomizationPicker:(id)a3
{
}

- (void)embeddedRichLinkViewDidDismissCustomizationPicker:(id)a3
{
}

- (BOOL)canPresentCustomizationPicker
{
  v2 = self;
  char v3 = sub_18F65665C();

  return v3 & 1;
}

- (void)presentCustomizationPicker
{
  v2 = self;
  sub_18F65691C();
}

- (NSString)urlText
{
  return (NSString *)sub_18F6A14F0((char *)self, (uint64_t)a2, (SEL *)&selRef_urlText);
}

- (NSString)entryItemUUID
{
  return (NSString *)sub_18F6A14F0((char *)self, (uint64_t)a2, (SEL *)&selRef_entryItemUUID);
}

@end