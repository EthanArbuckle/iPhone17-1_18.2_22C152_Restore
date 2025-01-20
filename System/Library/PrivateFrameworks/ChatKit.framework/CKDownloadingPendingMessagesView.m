@interface CKDownloadingPendingMessagesView
- (CKDownloadingPendingMessagesView)init;
- (CKDownloadingPendingMessagesView)initWithCoder:(id)a3;
- (CKDownloadingPendingMessagesView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)startAppearanceAnimations;
- (void)updateForLayoutDirectionWithScale:(double)a3;
- (void)updateMessageCountWith:(id)a3;
@end

@implementation CKDownloadingPendingMessagesView

- (CKDownloadingPendingMessagesView)init
{
  return (CKDownloadingPendingMessagesView *)CKDownloadingPendingMessagesView.init()();
}

- (CKDownloadingPendingMessagesView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_18F51FCD0();
}

- (void)updateMessageCountWith:(id)a3
{
  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___CKDownloadingPendingMessagesView_pendingMessageCountLabel);
  id v5 = a3;
  v6 = self;
  objc_msgSend(v4, sel_setAttributedText_, v5);
  sub_18F51E0AC();
}

- (void)updateForLayoutDirectionWithScale:(double)a3
{
  v4 = self;
  sub_18F51E324(a3);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_18F51E47C();
}

- (CKDownloadingPendingMessagesView)initWithFrame:(CGRect)a3
{
  result = (CKDownloadingPendingMessagesView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CKDownloadingPendingMessagesView_pendingMessageCountLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CKDownloadingPendingMessagesView_progressView);
}

- (void)startAppearanceAnimations
{
  v2 = self;
  sub_18F51F3E8();
}

@end