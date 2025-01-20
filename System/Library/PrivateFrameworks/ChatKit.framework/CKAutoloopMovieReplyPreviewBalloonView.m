@interface CKAutoloopMovieReplyPreviewBalloonView
- (CKAutoloopMovieReplyPreviewBalloonView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForDisplay;
@end

@implementation CKAutoloopMovieReplyPreviewBalloonView

- (CKAutoloopMovieReplyPreviewBalloonView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CKAutoloopMovieReplyPreviewBalloonView;
  v3 = -[CKAutoloopMovieBalloonView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(CKBalloonView *)v3 doubleTapGestureRecognizer];
    [v5 setEnabled:0];
  }
  return v4;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)CKAutoloopMovieReplyPreviewBalloonView;
  [(CKAutoloopMovieBalloonView *)&v5 layoutSubviews];
  v3 = [(CKAutoloopMovieBalloonView *)self muteButton];
  [v3 setHidden:1];

  v4 = +[CKUIBehavior sharedBehaviors];
  [v4 replyPreviewBalloonAlpha];
  -[CKAutoloopMovieReplyPreviewBalloonView setAlpha:](self, "setAlpha:");
}

- (void)prepareForDisplay
{
  v4.receiver = self;
  v4.super_class = (Class)CKAutoloopMovieReplyPreviewBalloonView;
  [(CKAutoloopMovieBalloonView *)&v4 prepareForDisplay];
  v3 = +[CKUIBehavior sharedBehaviors];
  [v3 replyPreviewBalloonAlpha];
  -[CKAutoloopMovieReplyPreviewBalloonView setAlpha:](self, "setAlpha:");
}

@end