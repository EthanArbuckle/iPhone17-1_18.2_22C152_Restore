@interface CKPhotoAttachmentStatusChatItem
- (BOOL)wantsDrawerLayout;
- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4;
- (Class)cellClass;
- (UIEdgeInsets)contentInsets;
- (char)transcriptOrientation;
- (id)layoutItemSpacingWithEnvironment:(id)a3 datasourceItemIndex:(int64_t)a4 allDatasourceItems:(id)a5 supplementryItems:(id)a6 sizeOverride:(CGSize)a7;
- (id)loadTranscriptText;
- (unint64_t)layoutType;
@end

@implementation CKPhotoAttachmentStatusChatItem

- (unint64_t)layoutType
{
  return 16;
}

- (id)layoutItemSpacingWithEnvironment:(id)a3 datasourceItemIndex:(int64_t)a4 allDatasourceItems:(id)a5 supplementryItems:(id)a6 sizeOverride:(CGSize)a7
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  if (a4 < 1)
  {
    v14 = 0;
  }
  else
  {
    v14 = [v12 objectAtIndex:a4 - 1];
  }
  if (+[CKChatItemLayoutUtilities nextItemIsOriginatorWithRepliesForIndex:a4 allDatasourceItems:v12])
  {
LABEL_5:
    v15 = +[CKUIBehavior sharedBehaviors];
    [v15 extraLargeTranscriptSpace];
LABEL_10:
    double v17 = v16;
  }
  else
  {
    switch([v14 layoutType])
    {
      case 1:
      case 4:
      case 5:
      case 7:
      case 8:
      case 13:
      case 14:
      case 17:
        v15 = +[CKUIBehavior sharedBehaviors];
        [v15 mediumTranscriptSpace];
        goto LABEL_10;
      case 2:
      case 3:
      case 10:
      case 11:
      case 23:
      case 24:
        v15 = +[CKUIBehavior sharedBehaviors];
        [v15 largeTranscriptSpace];
        goto LABEL_10;
      case 6:
      case 18:
        v15 = +[CKUIBehavior sharedBehaviors];
        [v15 smallTranscriptSpace];
        goto LABEL_10;
      case 12:
        goto LABEL_5;
      default:
        if (IMOSLoggingEnabled())
        {
          v20 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            id v21 = (id)objc_opt_class();
            *(_DWORD *)v25 = 138412546;
            *(void *)&v25[4] = v21;
            *(_WORD *)&v25[12] = 2112;
            *(void *)&v25[14] = objc_opt_class();
            id v22 = *(id *)&v25[14];
            _os_log_impl(&dword_18EF18000, v20, OS_LOG_TYPE_INFO, "CKChatItem_Layout: %@ shouldn't follow %@", v25, 0x16u);
          }
        }
        v23 = +[CKUIBehavior sharedBehaviors];
        [v23 smallTranscriptSpace];
        double v17 = v24;

        break;
    }
  }
  v18 = +[CKChatItemLayoutUtilities transcriptVerticalEdgeSpacingForChatItem:self previousChatItem:v14 topSpacing:v17 bottomSpacing:0.0];

  return v18;
}

- (UIEdgeInsets)contentInsets
{
  v2 = +[CKUIBehavior sharedBehaviors];
  [v2 senderTranscriptInsets];
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
  v2 = [(CKPhotoAttachmentStatusChatItem *)self _photoAttachmentStatusChatItem];
  int v3 = [v2 isFromMe];

  if (v3) {
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

- (BOOL)wantsDrawerLayout
{
  v5.receiver = self;
  v5.super_class = (Class)CKPhotoAttachmentStatusChatItem;
  if ([(CKChatItem *)&v5 wantsDrawerLayout])
  {
    v2 = +[CKUIBehavior sharedBehaviors];
    int v3 = [v2 timestampsPushBalloons] ^ 1;
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (id)loadTranscriptText
{
  v91[3] = *MEMORY[0x1E4F143B8];
  v2 = [(CKPhotoAttachmentStatusChatItem *)self _photoAttachmentStatusChatItem];
  uint64_t v3 = [v2 numberOfPhotos];
  uint64_t v4 = [v2 numberOfVideos];
  v82 = v2;
  uint64_t v5 = [v2 numberOfSavedAssets];
  if (v4 + v3)
  {
    if (v4) {
      BOOL v6 = 1;
    }
    else {
      BOOL v6 = v3 == 0;
    }
    uint64_t v7 = 1;
    if (v3 != 0 || v4 == 0) {
      uint64_t v7 = 2;
    }
    if (!v6) {
      uint64_t v7 = 0;
    }
    double v8 = off_1E5628F38[v7];
    double v9 = NSString;
    double v10 = CKFrameworkBundle();
    double v11 = [v10 localizedStringForKey:v8 value:&stru_1EDE4CA38 table:@"ChatKit"];
    double v12 = objc_msgSend(v9, "localizedStringWithFormat:", v11, v4 + v3);

    double v13 = [MEMORY[0x1E4F42738] sharedApplication];
    uint64_t v14 = [v13 userInterfaceLayoutDirection];

    if (v14 == 1) {
      v15 = @"\u200F";
    }
    else {
      v15 = @"\u200E";
    }
    uint64_t v16 = [(__CFString *)v15 stringByAppendingString:v12];
  }
  else
  {
    double v12 = CKFrameworkBundle();
    uint64_t v16 = [v12 localizedStringForKey:@"PHOTO_ATTACHMENT_STATUS_ITEMS_FALLBACK_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
  }

  v84 = (void *)v16;
  if (v5)
  {
    if (v4) {
      BOOL v17 = 1;
    }
    else {
      BOOL v17 = v3 == 0;
    }
    uint64_t v18 = 1;
    if (v3 != 0 || v4 == 0) {
      uint64_t v18 = 2;
    }
    if (!v17) {
      uint64_t v18 = 0;
    }
    if (v4 + v3 == v5)
    {
      if (v18 == 2)
      {
        v19 = CKFrameworkBundle();
        v20 = v19;
        id v21 = @"PHOTO_ATTACHMENT_STATUS_ALL_ITEMS_SAVED";
      }
      else if (v18 == 1)
      {
        v19 = CKFrameworkBundle();
        v20 = v19;
        id v21 = @"PHOTO_ATTACHMENT_STATUS_ALL_VIDEOS_SAVED";
      }
      else
      {
        v19 = CKFrameworkBundle();
        v20 = v19;
        id v21 = @"PHOTO_ATTACHMENT_STATUS_ALL_PHOTOS_SAVED";
      }
      v25 = [v19 localizedStringForKey:v21 value:&stru_1EDE4CA38 table:@"ChatKit"];
    }
    else
    {
      v29 = off_1E5628F50[v18];
      v30 = NSString;
      v31 = CKFrameworkBundle();
      v32 = [v31 localizedStringForKey:v29 value:&stru_1EDE4CA38 table:@"ChatKit"];
      v20 = objc_msgSend(v30, "localizedStringWithFormat:", v32, v5);

      v33 = [MEMORY[0x1E4F42738] sharedApplication];
      uint64_t v34 = [v33 userInterfaceLayoutDirection];

      if (v34 == 1) {
        v35 = @"\u200F";
      }
      else {
        v35 = @"\u200E";
      }
      v25 = [(__CFString *)v35 stringByAppendingString:v20];
    }

    v36 = NSString;
    v37 = CKFrameworkBundle();
    v38 = [v37 localizedStringForKey:@"PHOTO_ATTACHMENT_STATUS_HAS_SAVED_TITLE_FORMAT" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v39 = objc_msgSend(v36, "stringWithFormat:", v38, v16, v25);

    v40 = [MEMORY[0x1E4F42738] sharedApplication];
    uint64_t v41 = [v40 userInterfaceLayoutDirection];

    if (v41 == 1) {
      v42 = @"\u200F";
    }
    else {
      v42 = @"\u200E";
    }
    v83 = [(__CFString *)v42 stringByAppendingString:v39];
  }
  else
  {
    id v22 = NSString;
    v23 = CKFrameworkBundle();
    double v24 = [v23 localizedStringForKey:@"PHOTO_ATTACHMENT_STATUS_TITLE_FORMAT" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v25 = objc_msgSend(v22, "stringWithFormat:", v24, v16);

    uint64_t v26 = [MEMORY[0x1E4F42738] sharedApplication];
    uint64_t v27 = [v26 userInterfaceLayoutDirection];

    if (v27 == 1) {
      v28 = @"\u200F";
    }
    else {
      v28 = @"\u200E";
    }
    v83 = [(__CFString *)v28 stringByAppendingString:v25];
  }

  v43 = [MEMORY[0x1E4FB0850] defaultParagraphStyle];
  v44 = (void *)[v43 mutableCopy];

  objc_msgSend(v44, "setAlignment:", 2 * (-[CKPhotoAttachmentStatusChatItem transcriptOrientation](self, "transcriptOrientation") != 0));
  [v44 setLineBreakMode:2];
  uint64_t v88 = *MEMORY[0x1E4FB06F8];
  uint64_t v78 = v88;
  v45 = +[CKUIBehavior sharedBehaviors];
  v46 = [v45 transcriptRegularFont];
  v91[0] = v46;
  uint64_t v89 = *MEMORY[0x1E4FB0700];
  uint64_t v47 = v89;
  v48 = +[CKUIBehavior sharedBehaviors];
  v49 = [v48 theme];
  v50 = [v49 transcriptTextColor];
  uint64_t v90 = *MEMORY[0x1E4FB0738];
  uint64_t v51 = v90;
  v91[1] = v50;
  v91[2] = v44;
  uint64_t v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v91 forKeys:&v88 count:3];

  v53 = +[CKUIBehavior sharedBehaviors];
  uint64_t v54 = [v53 transcriptMessageStatusFont];

  v55 = +[CKUIBehavior sharedBehaviors];
  v56 = [v55 theme];
  v57 = [v56 attachmentBalloonActionColor];

  id v58 = objc_alloc(MEMORY[0x1E4F28E48]);
  v81 = (void *)v52;
  uint64_t v59 = v52;
  v60 = v44;
  v61 = (void *)[v58 initWithString:v83 attributes:v59];
  v62 = [v61 string];
  uint64_t v63 = [v62 rangeOfString:v84];
  uint64_t v65 = v64;

  v86[0] = v78;
  v86[1] = v47;
  v79 = (void *)v54;
  v87[0] = v54;
  v87[1] = v57;
  v86[2] = v51;
  v87[2] = v44;
  v66 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v87 forKeys:v86 count:3];
  if (v63 != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v61, "setAttributes:range:", v66, v63, v65);
  }
  v67 = [v61 string];
  uint64_t v68 = [v67 rangeOfString:@"__IMAGE_PLACEHOLDER__"];
  uint64_t v70 = v69;

  if (v68 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v71 = (void *)MEMORY[0x1E4F42A98];
    v85 = v57;
    v72 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v85 count:1];
    v73 = [v71 configurationWithPaletteColors:v72];

    v74 = [MEMORY[0x1E4F42A80] systemImageNamed:@"square.grid.2x2.fill" withConfiguration:v73];
    v75 = [MEMORY[0x1E4FB0870] textAttachmentWithImage:v74];
    v76 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithAttachment:v75 attributes:v66];
    objc_msgSend(v61, "replaceCharactersInRange:withAttributedString:", v68, v70, v76);
  }

  return v61;
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
  double v8 = [(CKChatItem *)self transcriptText];
  double v9 = [(CKChatItem *)self transcriptTraitCollection];
  [v9 displayScale];
  +[CKTranscriptActionButtonCell sizeThatFits:attributedText:displayScale:](CKTranscriptActionButtonCell, "sizeThatFits:attributedText:displayScale:", v8, width, height, v10);
  double v12 = v11;
  double v14 = v13;

  double v15 = v12;
  double v16 = v14;
  result.double height = v16;
  result.double width = v15;
  return result;
}

@end