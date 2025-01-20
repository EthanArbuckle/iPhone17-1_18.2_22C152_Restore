@interface CKLoadMoreChatItem
- (BOOL)displayDuringSend;
- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4;
- (Class)cellClass;
- (UIEdgeInsets)contentInsets;
- (UIEdgeInsets)transcriptTextAlignmentInsets;
- (char)transcriptOrientation;
- (id)layoutItemSpacingWithEnvironment:(id)a3 datasourceItemIndex:(int64_t)a4 allDatasourceItems:(id)a5 supplementryItems:(id)a6 sizeOverride:(CGSize)a7;
- (unint64_t)layoutType;
@end

@implementation CKLoadMoreChatItem

- (unint64_t)layoutType
{
  return 9;
}

- (id)layoutItemSpacingWithEnvironment:(id)a3 datasourceItemIndex:(int64_t)a4 allDatasourceItems:(id)a5 supplementryItems:(id)a6 sizeOverride:(CGSize)a7
{
  v7 = +[CKUIBehavior sharedBehaviors];
  [v7 topTranscriptSpace];
  double v9 = v8;

  v10 = [MEMORY[0x1E4F42640] fixedSpacing:v9];
  v11 = [MEMORY[0x1E4F42610] spacingForLeading:0 top:v10 trailing:0 bottom:v10];

  return v11;
}

- (UIEdgeInsets)transcriptTextAlignmentInsets
{
  double v2 = *MEMORY[0x1E4F437F8];
  double v3 = *(double *)(MEMORY[0x1E4F437F8] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F437F8] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIEdgeInsets)contentInsets
{
  double v2 = *MEMORY[0x1E4F437F8];
  double v3 = *(double *)(MEMORY[0x1E4F437F8] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F437F8] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (char)transcriptOrientation
{
  return 1;
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (BOOL)displayDuringSend
{
  return 1;
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
  double v4 = +[CKPrintController sharedInstance];
  int v5 = [v4 isPrinting];

  if (v5)
  {
    double v6 = *MEMORY[0x1E4F1DB30];
    double v7 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  else
  {
    +[CKTranscriptHeaderCell defaultCellHeight];
    double v7 = v8;
    double v6 = 0.0;
  }
  result.height = v7;
  result.width = v6;
  return result;
}

@end