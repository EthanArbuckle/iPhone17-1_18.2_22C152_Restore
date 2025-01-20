@interface CKPhotoStackReplyPreviewBalloonView
- (double)stackCornerRadius;
- (void)layoutSubviews;
@end

@implementation CKPhotoStackReplyPreviewBalloonView

- (double)stackCornerRadius
{
  return 5.0;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)CKPhotoStackReplyPreviewBalloonView;
  [(CKStaticPhotoStackBalloonView *)&v4 layoutSubviews];
  v3 = +[CKUIBehavior sharedBehaviors];
  [v3 replyPreviewBalloonAlpha];
  -[CKPhotoStackReplyPreviewBalloonView setAlpha:](self, "setAlpha:");
}

@end