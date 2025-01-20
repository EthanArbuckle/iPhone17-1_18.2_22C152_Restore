@interface CKHandwritingBalloonView
- (BOOL)shouldMaskWhenOpaque;
- (CGRect)maskFrame;
- (CKBalloonDescriptor_t)balloonDescriptor;
@end

@implementation CKHandwritingBalloonView

- (CKBalloonDescriptor_t)balloonDescriptor
{
  *(_OWORD *)&retstr->var6.alpha = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var5 = 0u;
  *(_OWORD *)&retstr->var6.green = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  v5.receiver = self;
  v5.super_class = (Class)CKHandwritingBalloonView;
  result = (CKBalloonDescriptor_t *)[(CKBalloonDescriptor_t *)&v5 balloonDescriptor];
  retstr->var1 = 0;
  return result;
}

- (CGRect)maskFrame
{
  v3 = +[CKUIBehavior sharedBehaviors];
  [(CKHandwritingBalloonView *)self balloonDescriptor];
  [v3 extensionBalloonContentInsetsForOrientation:2 * (v21 != 0)];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v20.receiver = self;
  v20.super_class = (Class)CKHandwritingBalloonView;
  [(CKTranscriptPluginBalloonView *)&v20 maskFrame];
  double v13 = v7 + v12;
  double v15 = v5 + v14;
  double v17 = v16 - (v7 + v11);
  double v19 = v18 - (v5 + v9);
  result.size.height = v19;
  result.size.width = v17;
  result.origin.y = v15;
  result.origin.x = v13;
  return result;
}

- (BOOL)shouldMaskWhenOpaque
{
  return 0;
}

@end