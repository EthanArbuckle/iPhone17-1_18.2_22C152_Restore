@interface CKTypingChatItem
- (BOOL)displayDuringSend;
- (BOOL)wantsDrawerLayout;
- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4;
- (CKTypingIndicatorLayerProtocol)indicatorLayer;
- (Class)cellClass;
- (UIEdgeInsets)contentInsets;
- (char)transcriptOrientation;
- (unint64_t)layoutType;
@end

@implementation CKTypingChatItem

- (UIEdgeInsets)contentInsets
{
  v2 = +[CKUIBehavior sharedBehaviors];
  [v2 balloonTranscriptInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (char)transcriptOrientation
{
  if ([(CKChatItem *)self isFromMe]) {
    return 2;
  }
  else {
    return 0;
  }
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (BOOL)displayDuringSend
{
  return 1;
}

- (BOOL)wantsDrawerLayout
{
  return 1;
}

- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double height = a3.height;
  double width = a3.width;
  if (a4)
  {
    long long v7 = *(_OWORD *)(MEMORY[0x1E4F437F8] + 16);
    *(_OWORD *)&a4->top = *MEMORY[0x1E4F437F8];
    *(_OWORD *)&a4->bottom = v7;
  }
  +[CKTypingIndicatorLayer defaultSize];
  double v9 = v8;
  double v11 = v10;
  +[CKTypingIndicatorLayer largeBubbleFrame];
  double v13 = v9 - v12;
  double v15 = v11 - v14;
  v16 = [(CKTypingChatItem *)self indicatorLayer];
  [v16 bounds];
  double v18 = v17;
  double v20 = v19;

  double v21 = fmin(fmax(v13 + v18, v9), width);
  double v22 = fmin(fmax(v15 + v20, v11), height);
  result.double height = v22;
  result.double width = v21;
  return result;
}

- (CKTypingIndicatorLayerProtocol)indicatorLayer
{
  v2 = objc_alloc_init(CKTypingIndicatorLayer);

  return (CKTypingIndicatorLayerProtocol *)v2;
}

- (unint64_t)layoutType
{
  return 1;
}

@end