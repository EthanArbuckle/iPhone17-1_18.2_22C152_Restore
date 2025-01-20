@interface CKTranscriptMessageScrollConfiguration
- (BOOL)allowOverScroll;
- (BOOL)animated;
- (BOOL)autoDismissHightlight;
- (BOOL)emphasize;
- (BOOL)highlight;
- (BOOL)inlineReplyOverlay;
- (CKTranscriptMessageScrollConfiguration)init;
- (NSString)messageGUID;
- (UIView)viewToAlignWith;
- (int64_t)partIndex;
- (unint64_t)scrollPosition;
- (void)setAllowOverScroll:(BOOL)a3;
- (void)setAnimated:(BOOL)a3;
- (void)setAutoDismissHightlight:(BOOL)a3;
- (void)setEmphasize:(BOOL)a3;
- (void)setHighlight:(BOOL)a3;
- (void)setInlineReplyOverlay:(BOOL)a3;
- (void)setMessageGUID:(id)a3;
- (void)setPartIndex:(int64_t)a3;
- (void)setScrollPosition:(unint64_t)a3;
- (void)setViewToAlignWith:(id)a3;
@end

@implementation CKTranscriptMessageScrollConfiguration

- (NSString)messageGUID
{
  swift_beginAccess();
  sub_18F7B6CA0();
  v2 = (void *)sub_18F7B97A0();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setMessageGUID:(id)a3
{
  uint64_t v4 = sub_18F7B97E0();
  uint64_t v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___CKTranscriptMessageScrollConfiguration_messageGUID);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (int64_t)partIndex
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___CKTranscriptMessageScrollConfiguration_partIndex);
  swift_beginAccess();
  return *v2;
}

- (void)setPartIndex:(int64_t)a3
{
  uint64_t v4 = (int64_t *)((char *)self + OBJC_IVAR___CKTranscriptMessageScrollConfiguration_partIndex);
  swift_beginAccess();
  *uint64_t v4 = a3;
}

- (BOOL)animated
{
  v2 = (BOOL *)self + OBJC_IVAR___CKTranscriptMessageScrollConfiguration_animated;
  swift_beginAccess();
  return *v2;
}

- (void)setAnimated:(BOOL)a3
{
  uint64_t v4 = (BOOL *)self + OBJC_IVAR___CKTranscriptMessageScrollConfiguration_animated;
  swift_beginAccess();
  *uint64_t v4 = a3;
}

- (BOOL)inlineReplyOverlay
{
  v2 = (BOOL *)self + OBJC_IVAR___CKTranscriptMessageScrollConfiguration_inlineReplyOverlay;
  swift_beginAccess();
  return *v2;
}

- (void)setInlineReplyOverlay:(BOOL)a3
{
  uint64_t v4 = (BOOL *)self + OBJC_IVAR___CKTranscriptMessageScrollConfiguration_inlineReplyOverlay;
  swift_beginAccess();
  *uint64_t v4 = a3;
}

- (BOOL)highlight
{
  v2 = (BOOL *)self + OBJC_IVAR___CKTranscriptMessageScrollConfiguration_highlight;
  swift_beginAccess();
  return *v2;
}

- (void)setHighlight:(BOOL)a3
{
  uint64_t v4 = (BOOL *)self + OBJC_IVAR___CKTranscriptMessageScrollConfiguration_highlight;
  swift_beginAccess();
  *uint64_t v4 = a3;
}

- (BOOL)emphasize
{
  v2 = (BOOL *)self + OBJC_IVAR___CKTranscriptMessageScrollConfiguration_emphasize;
  swift_beginAccess();
  return *v2;
}

- (void)setEmphasize:(BOOL)a3
{
  uint64_t v4 = (BOOL *)self + OBJC_IVAR___CKTranscriptMessageScrollConfiguration_emphasize;
  swift_beginAccess();
  *uint64_t v4 = a3;
}

- (BOOL)autoDismissHightlight
{
  v2 = (BOOL *)self + OBJC_IVAR___CKTranscriptMessageScrollConfiguration_autoDismissHightlight;
  swift_beginAccess();
  return *v2;
}

- (void)setAutoDismissHightlight:(BOOL)a3
{
  uint64_t v4 = (BOOL *)self + OBJC_IVAR___CKTranscriptMessageScrollConfiguration_autoDismissHightlight;
  swift_beginAccess();
  *uint64_t v4 = a3;
}

- (unint64_t)scrollPosition
{
  v2 = (unint64_t *)((char *)self + OBJC_IVAR___CKTranscriptMessageScrollConfiguration_scrollPosition);
  swift_beginAccess();
  return *v2;
}

- (void)setScrollPosition:(unint64_t)a3
{
  uint64_t v4 = (unint64_t *)((char *)self + OBJC_IVAR___CKTranscriptMessageScrollConfiguration_scrollPosition);
  swift_beginAccess();
  *uint64_t v4 = a3;
}

- (UIView)viewToAlignWith
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___CKTranscriptMessageScrollConfiguration_viewToAlignWith);
  swift_beginAccess();
  return (UIView *)*v2;
}

- (void)setViewToAlignWith:(id)a3
{
  uint64_t v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___CKTranscriptMessageScrollConfiguration_viewToAlignWith);
  swift_beginAccess();
  uint64_t v5 = *v4;
  *uint64_t v4 = a3;
  id v6 = a3;
}

- (BOOL)allowOverScroll
{
  v2 = (BOOL *)self + OBJC_IVAR___CKTranscriptMessageScrollConfiguration_allowOverScroll;
  swift_beginAccess();
  return *v2;
}

- (void)setAllowOverScroll:(BOOL)a3
{
  uint64_t v4 = (BOOL *)self + OBJC_IVAR___CKTranscriptMessageScrollConfiguration_allowOverScroll;
  swift_beginAccess();
  *uint64_t v4 = a3;
}

- (CKTranscriptMessageScrollConfiguration)init
{
  return (CKTranscriptMessageScrollConfiguration *)TranscriptMessageScrollConfiguration.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CKTranscriptMessageScrollConfiguration_viewToAlignWith);
}

@end