@interface CKUnavailableMomentShareBalloonView
+ (id)_secondaryLabelString;
- (CKUnavailableMomentShareBalloonView)initWithFrame:(CGRect)a3;
- (void)handleTap:(id)a3;
@end

@implementation CKUnavailableMomentShareBalloonView

- (CKUnavailableMomentShareBalloonView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CKUnavailableMomentShareBalloonView;
  v3 = -[CKMomentShareStatusBalloonView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:v3 action:sel_handleTap_];
    [(CKUnavailableMomentShareBalloonView *)v3 addGestureRecognizer:v4];
  }
  return v3;
}

+ (id)_secondaryLabelString
{
  v2 = CKFrameworkBundle();
  v3 = [v2 localizedStringForKey:@"CKUnavailableMomentShareBalloonViewMessage_IOS" value:&stru_1EDE4CA38 table:@"ChatKit"];

  return v3;
}

- (void)handleTap:(id)a3
{
  id v4 = [(CKBalloonView *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 didTapUnavailableMomentShareBalloonView:self];
  }
}

@end