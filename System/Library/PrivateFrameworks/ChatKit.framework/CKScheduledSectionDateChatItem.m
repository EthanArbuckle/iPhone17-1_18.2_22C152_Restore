@interface CKScheduledSectionDateChatItem
- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4;
- (Class)cellClass;
- (id)layoutItemSpacingWithEnvironment:(id)a3 datasourceItemIndex:(int64_t)a4 allDatasourceItems:(id)a5 supplementryItems:(id)a6 sizeOverride:(CGSize)a7;
@end

@implementation CKScheduledSectionDateChatItem

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (id)layoutItemSpacingWithEnvironment:(id)a3 datasourceItemIndex:(int64_t)a4 allDatasourceItems:(id)a5 supplementryItems:(id)a6 sizeOverride:(CGSize)a7
{
  double height = a7.height;
  double width = a7.width;
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  if (a4 < 1)
  {
    v17 = 0;
  }
  else
  {
    v16 = [v14 objectAtIndex:a4 - 1];
    v17 = v16;
    if (v16 && [v16 layoutType] == 26)
    {
      uint64_t v18 = +[CKChatItemLayoutUtilities transcriptVerticalEdgeSpacingForChatItem:self previousChatItem:v17 topSpacing:0.0 bottomSpacing:0.0];
      goto LABEL_7;
    }
  }
  v21.receiver = self;
  v21.super_class = (Class)CKScheduledSectionDateChatItem;
  uint64_t v18 = -[CKDateChatItem layoutItemSpacingWithEnvironment:datasourceItemIndex:allDatasourceItems:supplementryItems:sizeOverride:](&v21, sel_layoutItemSpacingWithEnvironment_datasourceItemIndex_allDatasourceItems_supplementryItems_sizeOverride_, v13, a4, v14, v15, width, height);
LABEL_7:
  v19 = (void *)v18;

  return v19;
}

- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double height = a3.height;
  double width = a3.width;
  v6 = [MEMORY[0x1E4F427E0] buttonWithType:1];
  v7 = +[CKUIBehavior sharedBehaviors];
  v8 = [v7 transcriptLabelAccessoryButtonConfiguration];
  [v6 setConfiguration:v8];

  v9 = +[CKUIBehavior sharedBehaviors];
  v10 = [v9 transcriptEmphasizedFontAttributes];
  v11 = (void *)[v10 mutableCopy];

  [v11 removeObjectForKey:*MEMORY[0x1E4FB0700]];
  id v12 = objc_alloc(MEMORY[0x1E4F28B18]);
  id v13 = CKFrameworkBundle();
  id v14 = [v13 localizedStringForKey:@"EDIT" value:&stru_1EDE4CA38 table:@"ChatKit"];
  id v15 = (void *)[v12 initWithString:v14 attributes:v11];
  [v6 setAttributedTitle:v15 forState:0];

  objc_msgSend(v6, "sizeThatFits:", width, height);
  double v17 = v16;
  double v19 = v18;

  double v20 = v17;
  double v21 = v19;
  result.double height = v21;
  result.double width = v20;
  return result;
}

@end