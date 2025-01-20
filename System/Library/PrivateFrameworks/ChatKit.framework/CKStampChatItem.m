@interface CKStampChatItem
- (BOOL)displayDuringSend;
- (Class)cellClass;
- (UIEdgeInsets)contentInsets;
- (char)transcriptOrientation;
- (id)layoutItemSpacingWithEnvironment:(id)a3 datasourceItemIndex:(int64_t)a4 allDatasourceItems:(id)a5 supplementryItems:(id)a6 sizeOverride:(CGSize)a7;
- (unint64_t)layoutType;
@end

@implementation CKStampChatItem

- (UIEdgeInsets)contentInsets
{
  v2 = +[CKUIBehavior sharedBehaviors];
  [v2 stampTranscriptInsets];
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
  return 1;
}

- (Class)cellClass
{
  double v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"CKStampChatItem.m" lineNumber:25 description:@"Subclasses must implement cellClass"];

  return 0;
}

- (BOOL)displayDuringSend
{
  return 1;
}

- (unint64_t)layoutType
{
  return 3;
}

- (id)layoutItemSpacingWithEnvironment:(id)a3 datasourceItemIndex:(int64_t)a4 allDatasourceItems:(id)a5 supplementryItems:(id)a6 sizeOverride:(CGSize)a7
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  if (a4 < 1)
  {
    double v14 = 0;
  }
  else
  {
    double v14 = [v12 objectAtIndex:a4 - 1];
  }
  v15 = +[CKUIBehavior sharedBehaviors];
  [v15 smallTranscriptSpace];
  double v17 = v16;

  v18 = +[CKUIBehavior sharedBehaviors];
  [v18 mediumTranscriptSpace];
  double v20 = v19;

  v21 = +[CKUIBehavior sharedBehaviors];
  [v21 largeTranscriptSpace];
  double v23 = v22;

  if (v14)
  {
    switch([v14 layoutType])
    {
      case 1:
      case 3:
      case 4:
      case 5:
      case 8:
      case 12:
      case 14:
        break;
      case 2:
      case 7:
      case 10:
      case 11:
      case 18:
      case 23:
      case 24:
        goto LABEL_6;
      case 9:
        v24 = +[CKUIBehavior sharedBehaviors];
        objc_msgSend(v24, "balloonBalloonTranscriptSpace:", objc_msgSend(v14, "contiguousType"));
        goto LABEL_8;
      case 17:
        double v23 = v20;
        break;
      default:
        if (IMOSLoggingEnabled())
        {
          v28 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            id v29 = (id)objc_opt_class();
            *(_DWORD *)v31 = 138412546;
            *(void *)&v31[4] = v29;
            *(_WORD *)&v31[12] = 2112;
            *(void *)&v31[14] = objc_opt_class();
            id v30 = *(id *)&v31[14];
            _os_log_impl(&dword_18EF18000, v28, OS_LOG_TYPE_INFO, "CKChatItem_Layout: %@ shouldn't follow %@", v31, 0x16u);
          }
        }
LABEL_6:
        double v23 = v17;
        break;
    }
  }
  else
  {
    v24 = +[CKUIBehavior sharedBehaviors];
    [v24 topTranscriptSpace];
LABEL_8:
    double v23 = v25;
  }
  v26 = +[CKChatItemLayoutUtilities transcriptVerticalEdgeSpacingForChatItem:previousChatItem:topSpacing:bottomSpacing:](CKChatItemLayoutUtilities, "transcriptVerticalEdgeSpacingForChatItem:previousChatItem:topSpacing:bottomSpacing:", self, v14, v23, 0.0, *(_OWORD *)v31, *(void *)&v31[16], v32);

  return v26;
}

@end