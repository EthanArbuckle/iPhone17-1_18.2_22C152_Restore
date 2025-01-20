@interface CKChatItemLayoutUtilities
+ (BOOL)layoutTypeIsMessageBalloonForChatItem:(id)a3;
+ (BOOL)needsAdditionalBracketPaddingForChatItem:(id)a3 prevChatItem:(id)a4;
+ (BOOL)nextItemIsOriginatorWithRepliesForIndex:(unint64_t)a3 allDatasourceItems:(id)a4;
+ (BOOL)nextMessageIsReplyForIndex:(unint64_t)a3 allDatasourceItems:(id)a4;
+ (BOOL)prevMessageIsReplyForIndex:(unint64_t)a3 allDatasourceItems:(id)a4;
+ (CGSize)sizeWithLayoutSize:(id)a3;
+ (double)adjustedBalloonTopSpacingWithSpacing:(double)a3 previousChatItem:(id)a4;
+ (double)adjustedTopSpacingForTextAlignmentInsetsWithSpacing:(double)a3 chatItem:(id)a4 previousChatItem:(id)a5;
+ (double)transcriptTapbackMinSpacingForSenderChatItem:(id)a3 withNextChatItem:(id)a4 previousItem:(id)a5 associatedChatItem:(id)a6;
+ (id)avatarSupplementaryItemForChatItem:(id)a3 layoutEnvironment:(id)a4;
+ (id)balloonEdgeSpacingForItemWithLayoutEnvironment:(id)a3 orientation:(char)a4 itemSize:(CGSize)a5 supplementaryItems:(id)a6;
+ (id)dynamicWidthLayoutSizeWithHeight:(double)a3;
+ (id)layoutGroupForItem:(id)a3;
+ (id)layoutSizeWithSize:(CGSize)a3;
+ (id)tapbackLayoutAnchorForAcknowledgmentChatItem:(id)a3;
+ (id)tapbackSupplementaryItemForChatItem:(id)a3 layoutEnvironment:(id)a4;
+ (id)transcriptBalloonVerticalLayoutSpacingWithTopSpacing:(double)a3 bottomSpacing:(double)a4 previousChatItem:(id)a5;
+ (id)transcriptVerticalEdgeSpacingForChatItem:(id)a3 previousChatItem:(id)a4 topSpacing:(double)a5 bottomSpacing:(double)a6;
@end

@implementation CKChatItemLayoutUtilities

+ (double)adjustedBalloonTopSpacingWithSpacing:(double)a3 previousChatItem:(id)a4
{
  id v5 = a4;
  if ([v5 layoutType] == 1 && objc_msgSend(v5, "hasTail"))
  {
    v6 = +[CKUIBehavior sharedBehaviors];
    [v6 balloonMaskTailSizeForTailShape:1];
    a3 = a3 - v7;
  }
  return a3;
}

+ (double)adjustedTopSpacingForTextAlignmentInsetsWithSpacing:(double)a3 chatItem:(id)a4 previousChatItem:(id)a5
{
  id v7 = a5;
  [a4 transcriptTextAlignmentInsets];
  double v9 = v8;
  [v7 transcriptTextAlignmentInsets];
  double v11 = v10;

  return a3 - (v9 + v11);
}

+ (id)transcriptVerticalEdgeSpacingForChatItem:(id)a3 previousChatItem:(id)a4 topSpacing:(double)a5 bottomSpacing:(double)a6
{
  id v9 = a3;
  id v10 = a4;
  if ([v9 layoutType] == 1)
  {
    +[CKChatItemLayoutUtilities adjustedBalloonTopSpacingWithSpacing:v10 previousChatItem:a5];
    a5 = v11;
  }
  +[CKChatItemLayoutUtilities adjustedTopSpacingForTextAlignmentInsetsWithSpacing:v9 chatItem:v10 previousChatItem:a5];
  v12 = objc_msgSend(MEMORY[0x1E4F42640], "fixedSpacing:");
  if (a6 == 0.0)
  {
    v13 = 0;
  }
  else
  {
    v13 = [MEMORY[0x1E4F42640] fixedSpacing:a6];
  }
  v14 = [MEMORY[0x1E4F42610] spacingForLeading:0 top:v12 trailing:0 bottom:v13];

  return v14;
}

+ (id)transcriptBalloonVerticalLayoutSpacingWithTopSpacing:(double)a3 bottomSpacing:(double)a4 previousChatItem:(id)a5
{
  id v7 = a5;
  if ([v7 layoutType] == 1 && objc_msgSend(v7, "hasTail"))
  {
    double v8 = +[CKUIBehavior sharedBehaviors];
    [v8 balloonMaskTailSizeForTailShape:1];
    a3 = a3 - v9;
  }
  id v10 = [MEMORY[0x1E4F42640] fixedSpacing:a3];
  if (a4 == 0.0)
  {
    double v11 = 0;
  }
  else
  {
    double v11 = [MEMORY[0x1E4F42640] fixedSpacing:a4];
  }
  v12 = [MEMORY[0x1E4F42610] spacingForLeading:0 top:v10 trailing:0 bottom:v11];

  return v12;
}

+ (id)dynamicWidthLayoutSizeWithHeight:(double)a3
{
  v4 = [MEMORY[0x1E4F42608] fractionalWidthDimension:1.0];
  id v5 = [MEMORY[0x1E4F42608] absoluteDimension:a3];
  v6 = [MEMORY[0x1E4F42638] sizeWithWidthDimension:v4 heightDimension:v5];

  return v6;
}

+ (BOOL)needsAdditionalBracketPaddingForChatItem:(id)a3 prevChatItem:(id)a4
{
  id v5 = a3;
  if (([a4 itemIsFromMe] & 1) != 0 || !objc_msgSend(v5, "itemIsFromMe"))
  {
    BOOL v10 = 0;
  }
  else
  {
    [v5 size];
    double v7 = v6;
    double v8 = +[CKUIBehavior sharedBehaviors];
    [v8 textBalloonMinHeight];
    BOOL v10 = v7 <= v9;
  }
  return v10;
}

+ (BOOL)prevMessageIsReplyForIndex:(unint64_t)a3 allDatasourceItems:(id)a4
{
  if ((uint64_t)(a3 - 1) < 1) {
    return 0;
  }
  int64_t v5 = a3;
  while (1)
  {
    double v6 = [a4 objectAtIndex:--v5];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      break;
    }

    if (v5 <= 1) {
      return 0;
    }
  }
  char v8 = [v6 itemIsReply];

  return v8;
}

+ (BOOL)nextMessageIsReplyForIndex:(unint64_t)a3 allDatasourceItems:(id)a4
{
  id v5 = a4;
  unint64_t v6 = a3 + 1;
  if (v6 >= [v5 count])
  {
LABEL_4:
    char v8 = 0;
  }
  else
  {
    while (1)
    {
      double v7 = [v5 objectAtIndex:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }

      if (++v6 >= [v5 count]) {
        goto LABEL_4;
      }
    }
    char v8 = [v7 itemIsReply];
  }
  return v8;
}

+ (BOOL)nextItemIsOriginatorWithRepliesForIndex:(unint64_t)a3 allDatasourceItems:(id)a4
{
  id v6 = a4;
  unint64_t v7 = a3 + 1;
  if (a3 + 1 >= [v6 count])
  {
    char v9 = 0;
  }
  else
  {
    char v8 = [v6 objectAtIndex:a3 + 1];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v8 itemIsThreadOriginator]) {
      char v9 = [a1 nextMessageIsReplyForIndex:v7 allDatasourceItems:v6];
    }
    else {
      char v9 = 0;
    }
  }
  return v9;
}

+ (double)transcriptTapbackMinSpacingForSenderChatItem:(id)a3 withNextChatItem:(id)a4 previousItem:(id)a5 associatedChatItem:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  uint64_t v13 = +[CKUIBehavior sharedBehaviors];
  [(id)v13 messageAcknowledgmentTranscriptBalloonRelativePosition];
  double v15 = v14;
  double v17 = v16;

  [v9 size];
  double v19 = v18;
  [v12 size];
  double v21 = v20 - v15;
  LODWORD(v13) = +[CKChatItemLayoutUtilities layoutTypeIsMessageBalloonForChatItem:v11];
  BOOL v22 = +[CKChatItemLayoutUtilities layoutTypeIsMessageBalloonForChatItem:v12];

  [v11 itemIsFromMe];
  int v23 = v13 ^ 1;
  if (v19 >= v21) {
    int v23 = 1;
  }
  int v24 = v23 | !v22;
  BOOL v25 = v19 < v21 && v22;
  if (v24) {
    BOOL v26 = v25;
  }
  else {
    BOOL v26 = v22;
  }
  double v27 = 0.0;
  if (v26)
  {
    [v10 size];
    double v29 = v17 + v28;
    [v9 size];
    double v31 = v29 - v30;
    v32 = +[CKUIBehavior sharedBehaviors];
    [v32 smallTranscriptSpace];
    double v27 = v31 + v33;
  }
  return v27;
}

+ (BOOL)layoutTypeIsMessageBalloonForChatItem:(id)a3
{
  unint64_t v3 = [a3 layoutType];
  return (v3 < 0xF) & (0x7002u >> v3);
}

+ (id)layoutSizeWithSize:(CGSize)a3
{
  double height = a3.height;
  v4 = [MEMORY[0x1E4F42608] absoluteDimension:a3.width];
  id v5 = [MEMORY[0x1E4F42608] absoluteDimension:height];
  id v6 = [MEMORY[0x1E4F42638] sizeWithWidthDimension:v4 heightDimension:v5];

  return v6;
}

+ (CGSize)sizeWithLayoutSize:(id)a3
{
  id v3 = a3;
  v4 = [v3 widthDimension];
  double v5 = 0.0;
  double v6 = 0.0;
  if ([v4 isAbsolute])
  {
    unint64_t v7 = [v3 widthDimension];
    [v7 dimension];
    double v6 = v8;
  }
  id v9 = [v3 heightDimension];
  if ([v9 isAbsolute])
  {
    id v10 = [v3 heightDimension];
    [v10 dimension];
    double v5 = v11;
  }
  double v12 = v6;
  double v13 = v5;
  result.double height = v13;
  result.width = v12;
  return result;
}

+ (id)layoutGroupForItem:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 layoutSize];
  double v5 = [v4 heightDimension];

  double v6 = [MEMORY[0x1E4F42608] fractionalWidthDimension:1.0];
  unint64_t v7 = [MEMORY[0x1E4F42638] sizeWithWidthDimension:v6 heightDimension:v5];
  double v8 = (void *)MEMORY[0x1E4F42618];
  v12[0] = v3;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  id v10 = [v8 verticalGroupWithLayoutSize:v7 subitems:v9];

  return v10;
}

+ (id)balloonEdgeSpacingForItemWithLayoutEnvironment:(id)a3 orientation:(char)a4 itemSize:(CGSize)a5 supplementaryItems:(id)a6
{
  double width = a5.width;
  int v7 = a4;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a6;
  id v10 = [v8 collectionLayoutEnvironment];
  double v11 = [v10 container];
  [v11 contentSize];
  double v13 = v12;

  [v8 marginInsets];
  double v15 = v14;
  double v17 = v16;
  double v18 = +[CKUIBehavior sharedBehaviors];
  [v18 balloonMaskTailSizeForTailShape:1];
  double v20 = v19;

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v21 = v9;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v44;
    double v25 = *MEMORY[0x1E4F1DAD8];
    double v26 = 0.0;
    double v27 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v44 != v24) {
          objc_enumerationMutation(v21);
        }
        double v29 = [*(id *)(*((void *)&v43 + 1) + 8 * i) containerAnchor];
        double v30 = v25;
        if ([v29 isAbsoluteOffset])
        {
          [v29 offset];
          double v30 = v31;
        }
        uint64_t v32 = [v29 edges] & 2;
        double v33 = fabs(v30);
        if (v33 >= v27 && v32 != 0) {
          double v27 = v33;
        }
        uint64_t v35 = [v29 edges] & 8;
        if (v33 >= v26 && v35 != 0) {
          double v26 = v33;
        }
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v43 objects:v47 count:16];
    }
    while (v23);
  }
  else
  {
    double v26 = 0.0;
    double v27 = 0.0;
  }

  if (v7 == 2)
  {
    double v38 = v20 + v13 - width - v17 - v26;
    v37 = (void *)MEMORY[0x1E4F42640];
    goto LABEL_26;
  }
  if (!v7)
  {
    v37 = (void *)MEMORY[0x1E4F42640];
    double v38 = v15 - v20 + v27;
LABEL_26:
    v39 = [v37 fixedSpacing:v38];
    goto LABEL_28;
  }
  v39 = 0;
LABEL_28:
  v40 = [MEMORY[0x1E4F42610] spacingForLeading:v39 top:0 trailing:0 bottom:0];

  return v40;
}

+ (id)avatarSupplementaryItemForChatItem:(id)a3 layoutEnvironment:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[CKUIBehavior sharedBehaviors];
  [v8 transcriptContactImageDiameter];
  double v10 = v9;

  double v11 = objc_msgSend(a1, "layoutSizeWithSize:", v10, v10);
  double v12 = objc_msgSend(MEMORY[0x1E4F425F0], "layoutAnchorWithEdges:absoluteOffset:", 6, -v10, 0.0);
  double v13 = [v7 IMChatItem];

  double v14 = [v13 guid];
  double v15 = +[CKTranscriptCollectionSupplementaryView supplementaryViewKindForGUID:v14];

  double v16 = [MEMORY[0x1E4F42648] supplementaryItemWithLayoutSize:v11 elementKind:v15 containerAnchor:v12];
  double v17 = [v6 collectionView];

  uint64_t v18 = objc_opt_class();
  double v19 = +[CKTranscriptCollectionSupplementaryView reuseIdentifier];
  [v17 registerClass:v18 forSupplementaryViewOfKind:v15 withReuseIdentifier:v19];

  return v16;
}

+ (id)tapbackSupplementaryItemForChatItem:(id)a3 layoutEnvironment:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v8 = objc_msgSend(v6, "visibleAssociatedMessageChatItems", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (!v9)
  {
    double v11 = 0;
    double v20 = 0;
    goto LABEL_13;
  }
  uint64_t v10 = v9;
  double v11 = 0;
  uint64_t v12 = *(void *)v26;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v26 != v12) {
        objc_enumerationMutation(v8);
      }
      double v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v15 = v14;

        double v11 = v15;
      }
    }
    uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
  }
  while (v10);

  if (v11)
  {
    [v11 size];
    id v8 = objc_msgSend(a1, "layoutSizeWithSize:");
    double v16 = [a1 tapbackLayoutAnchorForAcknowledgmentChatItem:v11];
    double v17 = [v6 IMChatItem];
    uint64_t v18 = [v17 guid];
    double v19 = +[CKTranscriptCollectionSupplementaryView supplementaryViewKindForGUID:v18];

    double v20 = [MEMORY[0x1E4F42648] supplementaryItemWithLayoutSize:v8 elementKind:v19 containerAnchor:v16];
    id v21 = [v7 collectionView];
    uint64_t v22 = objc_opt_class();
    uint64_t v23 = +[CKTranscriptCollectionSupplementaryView reuseIdentifier];
    [v21 registerClass:v22 forSupplementaryViewOfKind:v19 withReuseIdentifier:v23];

LABEL_13:
    goto LABEL_15;
  }
  double v20 = 0;
LABEL_15:

  return v20;
}

+ (id)tapbackLayoutAnchorForAcknowledgmentChatItem:(id)a3
{
  id v3 = a3;
  int v4 = [v3 transcriptOrientation];
  [v3 size];
  double v6 = v5;
  [v3 size];
  double v8 = v7;

  uint64_t v9 = +[CKUIBehavior sharedBehaviors];
  [v9 messageAcknowledgmentTranscriptBalloonRelativePosition];
  double v11 = v10;
  double v13 = v12;

  if (v4) {
    uint64_t v14 = 3;
  }
  else {
    uint64_t v14 = 9;
  }
  double v15 = v8 - v11;
  if (v4) {
    double v15 = -(v8 - v11);
  }
  double v16 = (void *)MEMORY[0x1E4F425F0];

  return (id)objc_msgSend(v16, "layoutAnchorWithEdges:absoluteOffset:", v14, v15, -(v6 + v13));
}

@end