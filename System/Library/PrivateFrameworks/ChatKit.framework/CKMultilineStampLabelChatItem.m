@interface CKMultilineStampLabelChatItem
- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4;
- (Class)cellClass;
@end

@implementation CKMultilineStampLabelChatItem

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
    a4->top = v9;
    a4->left = v10;
    a4->bottom = v11;
    a4->right = v12;
  }
  v13 = +[CKChatItemSizeCache sharedInstance];
  long long v30 = *MEMORY[0x1E4F1DB30];
  if (objc_msgSend(v13, "cachedSizeForChatItem:size:textAlignmentInsets:fittingSize:", self, &v30, 0, width, height))
  {
    double v15 = *((double *)&v30 + 1);
    double v14 = *(double *)&v30;
  }
  else
  {
    [(CKStampChatItem *)self contentInsets];
    double v18 = width - (v16 + v17);
    double v21 = height - (v19 + v20);
    v22 = [(CKChatItem *)self transcriptText];
    objc_msgSend(v22, "boundingRectWithSize:options:context:", 1, 0, v18, v21);
    double v24 = v23;
    double v26 = v25;
    if (CKMainScreenScale_once_88 != -1) {
      dispatch_once(&CKMainScreenScale_once_88, &__block_literal_global_219);
    }
    double v27 = *(double *)&CKMainScreenScale_sMainScreenScale_88;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_88 == 0.0) {
      double v27 = 1.0;
    }
    double v14 = ceil(v24 * v27) / v27;
    double v15 = ceil(v26 * v27) / v27;

    objc_msgSend(v13, "setCachedSizeForChatItem:size:textAlignmentInsets:fittingSize:", self, v14, v15, *MEMORY[0x1E4F437F8], *(double *)(MEMORY[0x1E4F437F8] + 8), *(double *)(MEMORY[0x1E4F437F8] + 16), *(double *)(MEMORY[0x1E4F437F8] + 24), width, height);
  }

  double v28 = v14;
  double v29 = v15;
  result.double height = v29;
  result.double width = v28;
  return result;
}

@end