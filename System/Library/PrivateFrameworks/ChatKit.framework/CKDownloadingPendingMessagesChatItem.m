@interface CKDownloadingPendingMessagesChatItem
- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4;
- (Class)cellClass;
@end

@implementation CKDownloadingPendingMessagesChatItem

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  if (a4)
  {
    a3 = (CGSize)*MEMORY[0x1E4F437F8];
    *(CGSize *)&a3.height = *(CGSize *)(MEMORY[0x1E4F437F8] + 16);
    *(_OWORD *)&a4->top = *MEMORY[0x1E4F437F8];
    *(CGSize *)&a4->bottom = *(CGSize *)&a3.height;
  }
  v4 = +[CKUIBehavior sharedBehaviors];
  [v4 transcriptDownloadingPendingMessagesViewDefaultSize];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

@end