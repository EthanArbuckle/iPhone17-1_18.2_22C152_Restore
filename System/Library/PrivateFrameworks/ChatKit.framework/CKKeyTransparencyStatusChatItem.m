@interface CKKeyTransparencyStatusChatItem
- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4;
- (Class)cellClass;
- (id)loadTranscriptText;
@end

@implementation CKKeyTransparencyStatusChatItem

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double height = a3.height;
  double width = a3.width;
  if (a4)
  {
    v8 = +[CKUIBehavior sharedBehaviors];
    [v8 transcriptBoldTextAlignmentInsets];
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;

    a4->top = v10;
    a4->left = v12;
    a4->bottom = v14;
    a4->right = v16;
  }
  +[CKKeyTransparencyTranscriptCell heightForChatItem:fittingSize:](CKKeyTransparencyTranscriptCell, "heightForChatItem:fittingSize:", self, width, height);
  double v18 = v17;
  double v19 = width;
  result.double height = v18;
  result.double width = v19;
  return result;
}

- (id)loadTranscriptText
{
  v3 = [(CKKeyTransparencyStatusChatItem *)self underlyingKTChatItem];
  v4 = [v3 affectedHandles];

  v5 = [(CKKeyTransparencyStatusChatItem *)self underlyingKTChatItem];
  v6 = +[CKKeyTransparencyTranscriptUtilities transcriptStringFromHandles:status:](CKKeyTransparencyTranscriptUtilities, "transcriptStringFromHandles:status:", v4, [v5 status]);

  return v6;
}

@end