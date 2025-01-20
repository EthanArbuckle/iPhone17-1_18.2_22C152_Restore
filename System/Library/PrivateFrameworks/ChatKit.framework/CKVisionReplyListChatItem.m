@interface CKVisionReplyListChatItem
+ (double)navigationBarHeight;
- (BOOL)displayDuringSend;
- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4;
- (Class)cellClass;
- (UIEdgeInsets)contentInsets;
- (UIEdgeInsets)transcriptTextAlignmentInsets;
- (_TtC7ChatKit17QuickReplyContent)quickReplyContent;
- (char)transcriptOrientation;
- (int64_t)groupRowIndex;
- (void)setQuickReplyContent:(id)a3;
@end

@implementation CKVisionReplyListChatItem

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

- (int64_t)groupRowIndex
{
  return 0;
}

+ (double)navigationBarHeight
{
  if (navigationBarHeight_onceToken != -1) {
    dispatch_once(&navigationBarHeight_onceToken, &__block_literal_global_261);
  }
  return *(double *)&navigationBarHeight_navigationBarHeight;
}

void __48__CKVisionReplyListChatItem_navigationBarHeight__block_invoke()
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F42BF8]);
  v0 = [v2 navigationBar];
  [v0 bounds];
  navigationBarHeight_navigationBarHeight = v1;
}

- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    a3 = (CGSize)*MEMORY[0x1E4F437F8];
    *(CGSize *)&a3.height = *(CGSize *)(MEMORY[0x1E4F437F8] + 16);
    *(_OWORD *)&a4->top = *MEMORY[0x1E4F437F8];
    *(CGSize *)&a4->bottom = *(CGSize *)&a3.height;
  }
  unint64_t v5 = [(CKVisionReplyListChatItem *)self groupRowIndex];
  v6 = [(QuickReplyContent *)self->_quickReplyContent rows];
  unint64_t v7 = [v6 count];

  double v8 = 0.0;
  if (v5 < v7)
  {
    v9 = [(QuickReplyContent *)self->_quickReplyContent rowHeights];
    v10 = [v9 objectAtIndexedSubscript:v5];
    [v10 floatValue];
    double v8 = v11;
  }
  if (IMOSLoggingEnabled())
  {
    v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v15 = 134218240;
      v16 = self;
      __int16 v17 = 2048;
      double v18 = v8;
      _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "[%p] Setting height to %f", (uint8_t *)&v15, 0x16u);
    }
  }
  double v13 = 0.0;
  double v14 = v8;
  result.height = v14;
  result.width = v13;
  return result;
}

- (_TtC7ChatKit17QuickReplyContent)quickReplyContent
{
  return self->_quickReplyContent;
}

- (void)setQuickReplyContent:(id)a3
{
}

- (void).cxx_destruct
{
}

@end