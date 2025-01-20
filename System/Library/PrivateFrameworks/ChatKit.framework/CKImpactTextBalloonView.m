@interface CKImpactTextBalloonView
- (CKImpactTextBalloonView)initWithFrame:(CGRect)a3;
@end

@implementation CKImpactTextBalloonView

- (CKImpactTextBalloonView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CKImpactTextBalloonView;
  v3 = -[CKTextBalloonView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(CKImpactTextBalloonView *)v3 layer];
    [v5 setMinificationFilter:*MEMORY[0x1E4F3A340]];
  }
  return v4;
}

@end