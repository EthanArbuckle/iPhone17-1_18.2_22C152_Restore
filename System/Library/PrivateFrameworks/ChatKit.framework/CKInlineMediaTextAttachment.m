@interface CKInlineMediaTextAttachment
+ (BOOL)supportsSecureCoding;
- (BOOL)usesTextAttachmentView;
- (CKMediaObject)mediaObject;
- (UIImage)image;
- (_TtC7ChatKit27CKInlineMediaTextAttachment)initWithCoder:(id)a3;
- (_TtC7ChatKit27CKInlineMediaTextAttachment)initWithData:(id)a3 ofType:(id)a4;
- (_TtC7ChatKit27CKInlineMediaTextAttachment)initWithDelegate:(id)a3 mediaObject:(id)a4;
- (id)imageForBounds:(CGRect)a3 textContainer:(id)a4 characterIndex:(int64_t)a5;
- (id)viewProviderForParentView:(id)a3 location:(id)a4 textContainer:(id)a5;
- (void)inlineMediaViewDidSelectGenerativeButton:(id)a3;
- (void)setImage:(id)a3;
@end

@implementation CKInlineMediaTextAttachment

- (CKMediaObject)mediaObject
{
  return (CKMediaObject *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                  + OBJC_IVAR____TtC7ChatKit27CKInlineMediaTextAttachment_mediaObject));
}

- (_TtC7ChatKit27CKInlineMediaTextAttachment)initWithDelegate:(id)a3 mediaObject:(id)a4
{
  return (_TtC7ChatKit27CKInlineMediaTextAttachment *)CKInlineMediaTextAttachment.init(delegate:mediaObject:)((uint64_t)a3, a4);
}

- (_TtC7ChatKit27CKInlineMediaTextAttachment)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7ChatKit27CKInlineMediaTextAttachment_viewProvider) = 0;
  uint64_t v5 = OBJC_IVAR____TtC7ChatKit27CKInlineMediaTextAttachment_mediaView;
  type metadata accessor for CKInlineMediaView();
  id v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  swift_unknownObjectWeakInit();

  result = (_TtC7ChatKit27CKInlineMediaTextAttachment *)sub_18F7BA5D0();
  __break(1u);
  return result;
}

- (UIImage)image
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for CKInlineMediaTextAttachment();
  v2 = [(CKInlineMediaTextAttachment *)&v4 image];

  return v2;
}

- (void)setImage:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CKInlineMediaTextAttachment();
  id v4 = a3;
  id v5 = v6.receiver;
  [(CKInlineMediaTextAttachment *)&v6 setImage:v4];
  sub_18F680E94();
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
  sub_18F680F9C(a3, (uint64_t)a4, a5);
  v13 = v12;

  swift_unknownObjectRelease();

  return v13;
}

- (id)imageForBounds:(CGRect)a3 textContainer:(id)a4 characterIndex:(int64_t)a5
{
  id v5 = [(CKInlineMediaTextAttachment *)self image];

  return v5;
}

- (_TtC7ChatKit27CKInlineMediaTextAttachment)initWithData:(id)a3 ofType:(id)a4
{
  if (a3)
  {
    id v5 = a4;
    id v6 = a3;
    sub_18F7B60D0();
  }
  result = (_TtC7ChatKit27CKInlineMediaTextAttachment *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7ChatKit27CKInlineMediaTextAttachment_viewProvider));

  v3 = (char *)self + OBJC_IVAR____TtC7ChatKit27CKInlineMediaTextAttachment_delegate;

  sub_18F4C25DC((uint64_t)v3);
}

- (void)inlineMediaViewDidSelectGenerativeButton:(id)a3
{
  uint64_t v5 = MEMORY[0x192FBC390]((char *)self + OBJC_IVAR____TtC7ChatKit27CKInlineMediaTextAttachment_delegate, a2);
  if (v5)
  {
    id v6 = (void *)v5;
    uint64_t v7 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7ChatKit27CKInlineMediaTextAttachment_mediaObject);
    id v8 = a3;
    id v9 = self;
    objc_msgSend(v6, sel_inlineMediaViewTextAttachmentDidRequestGenerativeInteraction_, v7);

    swift_unknownObjectRelease();
  }
}

@end