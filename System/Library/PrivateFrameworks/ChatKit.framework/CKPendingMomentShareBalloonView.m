@interface CKPendingMomentShareBalloonView
- (BOOL)canUseOpaqueMask;
- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4;
- (CKBalloonDescriptor_t)balloonDescriptor;
- (char)balloonStyle;
- (char)color;
- (id)attachmentView;
- (void)prepareForDisplay;
@end

@implementation CKPendingMomentShareBalloonView

- (char)color
{
  return -1;
}

- (char)balloonStyle
{
  return 0;
}

- (id)attachmentView
{
  return 0;
}

- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  v4 = +[CKUIBehavior sharedBehaviors];
  [v4 attachmentBalloonSize];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (BOOL)canUseOpaqueMask
{
  return 0;
}

- (CKBalloonDescriptor_t)balloonDescriptor
{
  *(_OWORD *)&retstr->var6.alpha = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var5 = 0u;
  *(_OWORD *)&retstr->var6.green = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  v5.receiver = self;
  v5.super_class = (Class)CKPendingMomentShareBalloonView;
  CGSize result = (CKBalloonDescriptor_t *)[(CKBalloonDescriptor_t *)&v5 balloonDescriptor];
  retstr->var4 = -1;
  retstr->var1 = 0;
  return result;
}

- (void)prepareForDisplay
{
  v7.receiver = self;
  v7.super_class = (Class)CKPendingMomentShareBalloonView;
  [(CKAttachmentBalloonView *)&v7 prepareForDisplay];
  v3 = [(CKPendingMomentShareBalloonView *)self layer];
  objc_msgSend(v3, "setShadowOffset:", 0.0, 7.0);

  v4 = [(CKPendingMomentShareBalloonView *)self layer];
  LODWORD(v5) = 1045220557;
  [v4 setShadowOpacity:v5];

  double v6 = [(CKPendingMomentShareBalloonView *)self layer];
  [v6 setShadowRadius:27.0];
}

@end